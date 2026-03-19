#!/usr/bin/with-contenv bashio
set -e
set -u

# Set restrictive umask for the entire script
umask 0077

# Initialize variables to ensure they are defined (for set -u)
MQTT_HOST=""
MQTT_PORT=""
MQTT_USER=""
MQTT_PSWD=""
ENOCEAN_PORT=""
EEP_FILE=""
DEBUG_FLAG=""

bashio::config.require 'device_file'
bashio::config.require 'mqtt.discovery_prefix'
bashio::config.require 'mqtt.prefix'
bashio::config.require 'mqtt.client_id'
bashio::config.require 'mqtt.keepalive'

bashio::log.green "Preparing to start..."

# Set files to be used
CONFIG_FILE="/data/enoceanmqtt.conf"
DB_FILE="/data/enoceanmqtt_db.json"
DEVICE_FILE="$(bashio::config 'device_file')"
if [ ! -f "$DEVICE_FILE" ]; then
    bashio::exit.nok "Device file not found at $DEVICE_FILE"
fi
LOG_FILE="$(bashio::config 'logging.log_file')"
MAPPING_FILE="$(bashio::config 'mapping_files.mapping_file')"
bashio::log.blue "Retrieved devices file: $DEVICE_FILE"

# Retrieve EnOcean key connection parameters
if ! bashio::config.is_empty 'enocean_tcp'; then
  ENOCEAN_PORT="$(bashio::config 'enocean_tcp')"
  bashio::log.blue "TCP EnOcean key = $ENOCEAN_PORT"
elif ! bashio::config.is_empty 'enocean_port'; then
  ENOCEAN_PORT="$(bashio::config 'enocean_port')"
  bashio::log.blue "Serial EnOcean key = $ENOCEAN_PORT"
else
  bashio::exit.nok "No EnOcean key configured"
fi

# Retrieve MQTT connection parameters
if ! bashio::config.is_empty 'mqtt.host'; then
  MQTT_HOST="$(bashio::config 'mqtt.host')"
fi
if ! bashio::config.is_empty 'mqtt.port'; then
  MQTT_PORT="$(bashio::config 'mqtt.port')"
fi
if ! bashio::config.is_empty 'mqtt.user'; then
  MQTT_USER="$(bashio::config 'mqtt.user')"
fi
if ! bashio::config.is_empty 'mqtt.pwd'; then
  MQTT_PSWD="$(bashio::config 'mqtt.pwd')"
fi

if [ -z "${MQTT_HOST}" ] && \
   [ -z "${MQTT_PORT}" ] && \
   [ -z "${MQTT_USER}" ] && \
   [ -z "${MQTT_PSWD}" ]; then
  if bashio::var.has_value "$(bashio::services 'mqtt')"; then
    MQTT_HOST="$(bashio::services 'mqtt' 'host')"
    MQTT_PORT="$(bashio::services 'mqtt' 'port')"
    MQTT_USER="$(bashio::services 'mqtt' 'username')"
    MQTT_PSWD="$(bashio::services 'mqtt' 'password')"
  fi
fi

# Check MQTT parameters
if [ -z "${MQTT_HOST}" ] || \
   [ -z "${MQTT_PORT}" ] || \
   [ -z "${MQTT_USER}" ] || \
   [ -z "${MQTT_PSWD}" ]; then
  bashio::log.blue "mqtt_host = $MQTT_HOST"
  bashio::log.blue "mqtt_port = $MQTT_PORT"
  bashio::log.blue "mqtt_user = $MQTT_USER"
  if bashio::var.has_value "${MQTT_PSWD}"; then
    bashio::log.blue "mqtt_pwd  = ******"
  else
    bashio::log.blue "mqtt_pwd  = "
  fi
  bashio::exit.nok "MQTT broker connection not fully configured"
fi

# Debug parameter
if bashio::var.true "$(bashio::config 'logging.debug')"; then
  DEBUG_FLAG="--debug"
else
  DEBUG_FLAG=""
fi

# Create enoceanmqtt configuration file
MQTT_PREFIX=$(bashio::config 'mqtt.prefix')
MQTT_DISCOVERY_PREFIX=$(bashio::config 'mqtt.discovery_prefix')
MQTT_PREFIX="${MQTT_PREFIX%/}/"
MQTT_DISCOVERY_PREFIX="${MQTT_DISCOVERY_PREFIX%/}/"

{
  printf "[CONFIG]\n"
  printf "enocean_port          = %s\n" "${ENOCEAN_PORT}"
  printf "log_packets           = %s\n" "$(bashio::config 'logging.log_packets')"
  printf "overlay               = HA\n"
  printf "db_file               = %s\n" "${DB_FILE}"
  printf "mapping_file          = %s\n" "${MAPPING_FILE}"
  printf "mqtt_discovery_prefix = %s\n" "${MQTT_DISCOVERY_PREFIX}"
  printf "mqtt_host             = %s\n" "${MQTT_HOST}"
  printf "mqtt_port             = %s\n" "${MQTT_PORT}"
  printf "mqtt_client_id        = %s\n" "$(bashio::config 'mqtt.client_id')"
  printf "mqtt_keepalive        = %s\n" "$(bashio::config 'mqtt.keepalive')"
  printf "mqtt_prefix           = %s\n" "${MQTT_PREFIX}"
  printf "mqtt_user             = %s\n" "${MQTT_USER}"
  printf "mqtt_pwd              = %s\n" "${MQTT_PSWD}"
  printf "mqtt_debug            = %s\n" "$(bashio::config 'logging.debug')"
  printf "\n"
  cat "$DEVICE_FILE"
} > "${CONFIG_FILE}"
bashio::log.debug "Configuration written to ${CONFIG_FILE}"

# Delete previous session log
rm -f "$LOG_FILE"

if ! bashio::config.is_empty 'mapping_files.eep_file'; then
   EEP_FILE=$(bashio::config 'mapping_files.eep_file')
   EEP_FILE_LOCATION=$(find /app/venv/lib/ -name "EEP.xml" -print -quit 2>/dev/null)
   if [ -f "$EEP_FILE" ]; then
      bashio::log.green "Installing custom EEP.xml ..."
      cp -f "$EEP_FILE" "$EEP_FILE_LOCATION"
   else
      bashio::exit.nok "Custom EEP file not found at location $EEP_FILE"
   fi
fi

bashio::log.green "Starting EnOceanMQTT..."
# shellcheck source=/dev/null
. /app/venv/bin/activate
enoceanmqtt $DEBUG_FLAG --logfile "$LOG_FILE" "$CONFIG_FILE"
