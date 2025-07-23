# Configuration

1. Create a configuration file enoceanmqtt.devices ([sample](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon-dev/enoceanmqtt.devices.sample)) in the configuration folder of Home Assistant
2. Select the enocean key in the list
3. Leave the MQTT broker configuration empty if you want to use your Home Assistant Mosquitto broker parameters.

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

# Additional Information

I greatly recommend to have a look at the [wiki](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki) page for all sort of information and material regarding HA_enoceanmqtt.
