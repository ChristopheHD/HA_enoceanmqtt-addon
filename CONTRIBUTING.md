# Adding new devices

You can modify the *__`mapping.yaml`__* file to add new devices or new entities to already supported devices.  
Your changes will be taken into account after a restart.

A device is defined as, for example:
```yaml
0xD5:
   0x00:
      0x01:
         device_config:
            command: ""
            channel: ""
            log_learn: ""
            direction: ""
            answer: ""
         entities:
            - component: binary_sensor
              name: "contact"
              config:
                 state_topic: ""
                 value_template: "{{ value_json.CO }}"
                 payload_on: "0"
                 payload_off: "1"
```
<br/>

This indicates that the EnOcean device with EEP D5-00-01 will be mapped in Home Assistant to a single entity and that entity will be a binary sensor.

- `entities` is a list of the Home Assistant entities of the device.
  - `component` is the type of the entity
  - `name` defines the suffix that will be added after the device name to identify the entity.
    The entity name is of the form `e2m_<device_name>_<name>` where `<device_name>` is the name of the device set by the user in the device configuration file.
  - `config` defines the MQTT discovery configuration for the entity. Refer to the [MQTT Discovery documentation](https://www.home-assistant.io/integrations/mqtt#mqtt-discovery) to properly set this field.
    You will also need the [EEP documentation](http://tools.enocean-alliance.org/EEPViewer) to correctly set topics and values.  
    As enoceanmqtt interacts with the device through the device root topic `<mqtt_prefix>/<device_name>`, MQTT entities topics are derived from this device root topic.  
    Hence, `state_topic = ""`  indicates that the `state_topic` to be used is the device root topic.  
    `state_topic = "<topic>"` would have indicated that the `state_topic` to be used is `<mqtt_prefix>/<device_name>/<topic>`.
- `device_config` indicates the enoceanmqtt parameters that should be used for this EEP. Refer to the [enoceanmqtt documentation](https://github.com/embyt/enocean-mqtt#list-of-device-options) to properly set this field.

Considering a user adds a D5-00-01 device in the device configuration file as follow:
```
[door_sensors/myD50001]
address = 0xBABECAFE
rorg = 0xD5
func = 0x00
type = 0x01
```

Then the user will have in Home Assistant, a device named `e2m_door_sensors_myD50001` with 3 new entities:
```
e2m_door_sensors_myD50001
   e2m_door_sensors_myD50001_contact
   e2m_door_sensors_myD50001_rssi (automatically generated entity for the device RSSI)
   e2m_door_sensors_myD50001_date (automatically generated entity indicating the elapsed time since the device sent his latest telegram)
```

**Note**: Do not forget to make a pull request to integrate your changes.
