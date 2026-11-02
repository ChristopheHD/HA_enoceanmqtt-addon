# Configuration

1. To import an existing device list, create an `enoceanmqtt.devices` configuration file ([sample](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon/enoceanmqtt.devices.sample)) in the Home Assistant configuration folder. This is optional; devices can also be added from the app's web interface.
2. Select the EnOcean key in the list.
3. Leave the MQTT broker configuration empty if you want to use your Home Assistant Mosquitto broker parameters.
4. Start the app and open **EnOcean MQTT** in the Home Assistant sidebar to add or manage devices. Imported device-file entries are migrated on first startup.

For advanced configuration, see the related [wiki page](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Installation#configuration) for more details.

# Pairing

When pairing is needed for your device, use the following procedure:
1. Go to [Settings](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Pairing-your-device#settings)
1. &rarr; [Devices & Services](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Pairing-your-device#devices--services)
1. &rarr; [Under Mosquitto Broker click on xx devices](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Pairing-your-device#under-mosquitto-broker-click-on-xx-devices)
1. &rarr; [Select the __`ENOCEANMQTT`__ device](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Pairing-your-device#select-the-enoceanmqtt-device)
1. &rarr; [Turn on the __`LEARN`__ switch](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Pairing-your-device#learn-button).  
1. Follow the instructions of your device regarding pairing to put it in pairing mode.    
   The pairing response will be submitted automatically.  
1. Turn off the __`LEARN`__ switch once pairing is completed to avoid unwanted pairing with other devices.

See the related [wiki page](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Pairing-your-device) for more details.

# Troubleshoot

In case of issue, please check the following:
- The EnOcean key is correclty configured in the configuration tab of the app
- No other integration or app is using the EnOcean key
- The official Home Assistant EnOcean integration is not activated

Issues can be raised on [GitHub](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/issues).
New features or questions can be asked on [GitHub discussions](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/discussions)
