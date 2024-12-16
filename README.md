<a name="readme-top"></a>

<!--
*** Thanks for using Document My Project. (https://github.com/luisvent/document_my_project)
*** If you have a suggestion that would make this better, please fork
*** the repo and create a pull request or simply open an issue.
*** Don't forget to give the project a star!
-->

<div align="center">

<a href="" target="_blank" title="Go to  website">
<img width="196px" alt="Home Assistant enOcean addon" src="https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon/logo.png?raw=true">
</a>

# Home Assistant enOcean addon

Easily integrate enOcean protocol using MQTT layer

</div>

<div align="center"><h4><a href="#-about-the-project">ℹ️ About the Project</a> • <a href="#-stack-tech">🛠 Stack Tech</a> • <a href="#-setup">⚙ ️Setup</a> • <a href="#-contributing">👏🏻 Contributing</a></h4></div>

<!-- TABLE_CONTENT_PLACEHOLDER -->

## ℹ️ About the Project

This is the [Home Assistant](https://www.home-assistant.io/) addon for [HA_enoceanmqtt](https://github.com/aseracorp/HA_enoceanmqtt).  
HA_enoceanmqtt allows to easily have access to EnOcean devices in Home Assistant through MQTT.

## 🛠 Stack Tech

<img src="https://raw.githubusercontent.com/mak-gitdev/HA_enoceanmqtt-addon/master/.github/images/install_addon.svg" alt="Install Addon" width="75%"/>
<br/>

## ⚙ ️Setup

### Installation

To install this project, follow these steps:

#### Installation

1. If you don't have a MQTT broker yet, click on the below button and then **Install** or in Home Assistant go to **Settings → Add-ons → Add-on store** and install the **Mosquitto broker** addon.

[![](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mosquitto)

2. Click on the below button and then **Add** or go back to the **Add-on store**, click **⋮ → Repositories**, fill in</br> **`https://github.com/ChristopheHD/HA_enoceanmqtt-addon`** and click **Add → Close**.

[![](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/ChristopheHD/HA_enoceanmqtt-addon)

3. Click on the addon and press **Install** and wait until the addon is installed.

#### Configuration

1. Click on **Configuration**
   - If you already have a previous valid configuration, click **⋮ → Edit as YAML** and paste your previously saved configuration. Otherwise, follow the instructions below.
   - Adapt the [`addon/enoceanmqtt.devices.sample`](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon-dev/enoceanmqtt.devices.sample) and put it to your Home Assistant **/config** directory. You can use the Home Assistant **File Editor**.  
     **Tip**: Your device name can contain `/` e.g. `[lights/livingroom]`. This allows you to group your devices by type when exploring MQTT messages.
   - Indicate the location of this device file under the **device_file** entry.
   - Leave empty the **mapping_file** entry to use the default mapping file. If you want to use a custom mapping file, indicate the location of your mapping file. This can be useful for people wanting to add support for new devices or customize the existing ones. Refer to this [wiki page](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Examples#using-custom-mappingyaml-andor-eepxml-files) for more details.
   - Leave empty the **eep_file** entry to use the default EEP.xml file. If you want to use a custom EEP.xml file, indicate the location of your EEP.xml file. This can be useful for people wanting to add support for new devices not yet supported by the Python EnOcean library. Refer to this [wiki page](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Examples#using-custom-mappingyaml-andor-eepxml-files) for more details.
   - Indicate your preferred location for the log file under the **log_file** entry. It shall be in your Home Assistant **/config** directory.
   - Select the serial interface of your EnOcean transceiver in the list of detected serial ports. When using yaml configuration, the format is for example:
     ```yaml
     enocean_port: /dev/ttyUSB0
     ```
   - If you are **not** using the Mosquitto broker addon, fill in your MQTT details. Otherwise, leave empty the MQTT broker configuration. The format is for example:
     ```yaml
     host: localhost
     port: "1883"
     user: my_user
     pwd: my_password
     ```
   - Indicate the `mqtt_discovery_prefix` under the **mqtt_discovery_prefix** entry. This is the MQTT prefix used for [MQTT Discovery](home-assistant.io/integrations/mqtt/#mqtt-discovery) mechanism from the MQTT integration. It defaults to `homeassistant` and can be configured in the Home Assistant MQTT integration as follow:
     ```yaml
     mqtt:
       discovery_prefix: <prefix>
     ```
     If you have other HA integrations using MQTT discovery (e.g. zigbee2mqtt, etc.), **mqtt_discovery_prefix** should be set to `homeassistant` as it seems to be the one used in general.
   - Indicate the `mqtt_prefix` under the **mqtt_prefix** entry. This is the prefix which will be used to interact with your EnOcean devices.  
     EnOceanMQTT will interact with EnOcean devices through the device root topic `<mqtt_prefix>/<device_name>`.
   - Turn on the **debug** switch if you want a very verbose log file.
   - Other settings can be kept to their default values.
   - Click **Save**
   - **Tip:** it is possible to refer to variables in the Home Assistant `secrets.yaml` file by using e.g. `pwd: '!secret mqtt_pwd'`
1. Start the addon by going to **Info** and click **Start**
1. Wait till HA_enoceanmqtt starts and press **Log** to verify HA_enoceanmqtt started correctly.

## 👏🏻 Contributing

We welcome contributions from the community! If you would like to contribute to this project, please follow the guidelines below.

### Ways to Contribute

- Report bugs or issues by opening a new issue on our GitHub repository.
- Suggest new features or improvements by opening a new issue on our GitHub repository.
- Contribute code by forking the repository, making changes, and submitting a pull request.

### Contribution Instructions

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b my-feature-branch`.
3. Make the necessary changes and commit them: `git commit -am 'Add my new feature'`.
4. Push your branch to your forked repository: `git push origin my-feature-branch`.
5. Open a pull request against the main repository, describing the changes you made and why they should be merged.

For more information on how to contribute, please visit [Contribution Guidelines](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Contributing).

---

 <div align="center">Built with ❤️ with <a href="https://github.com/luisvent/document_my_project">Document My Project</a></div>
