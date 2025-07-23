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

![downloads](https://img.shields.io/badge/dynamic/json?color=41BDF5&logo=home-assistant&label=addon%20usage&suffix=%20installs&cacheSeconds=15600&url=https://analytics.home-assistant.io/addons.json&query=$.f93730fa_ha_enoceanmqtt_aseracorp.total)

</div>

<div align="center"><h4><a href="#-about-the-project">ℹ️ About the Project</a> • <a href="#-stack-tech">🛠 Stack Tech</a> • <a href="#-setup">⚙ ️Setup</a> • <a href="#-contributing">👏🏻 Contributing</a></h4></div>

<!-- TABLE_CONTENT_PLACEHOLDER -->

## ℹ️ About the Project

This is the [Home Assistant](https://www.home-assistant.io/) addon for [HA_enoceanmqtt](https://github.com/ChristopheHD/HA_enoceanmqtt).  
HA_enoceanmqtt allows to easily have access to EnOcean devices in Home Assistant through MQTT.

## 🛠 Stack Tech

<img src="https://raw.githubusercontent.com/mak-gitdev/HA_enoceanmqtt-addon/master/.github/images/install_addon.svg" alt="Install Addon" width="75%"/>
<br/>

## ⚙ ️Simple setup

### Installation

To install this project, follow these steps:

#### Installation

1. If you don't have a MQTT broker yet, click on the below button and then **Install** or in Home Assistant go to **Settings → Add-ons → Add-on store** and install the **Mosquitto broker** addon.

[![](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mosquitto)

2. Click on the below button and then **Add** or go back to the **Add-on store**, click **⋮ → Repositories**, fill in</br> **`https://github.com/ChristopheHD/HA_enoceanmqtt-addon`** and click **Add → Close**.

[![](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/ChristopheHD/HA_enoceanmqtt-addon)

3. Click on the addon and press **Install** and wait until the addon is installed.

#### Configuration

1. Adapt the [`addon/enoceanmqtt.devices.sample`](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon-dev/enoceanmqtt.devices.sample) (refer to the [wiki](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki) for help) and put it to your Home Assistant **/config** directory. You can use the Home Assistant **File Editor**.
1. Go on the **Configuration** tab of the addon
   - Indicate the location of this device file under the **device_file** entry (on HAOS, it would be `/config/enoceanmqtt.devices`).
   - Select the serial interface of your EnOcean transceiver in the list of detected serial ports. When using yaml configuration, the format is for example:
     ```yaml
     enocean_port: /dev/ttyUSB0
     ```
   - Click **Save** at the bottom of the page
1. Start the addon by going to **Info** tab and click **Start**

## 👏🏻 Contributing

We welcome contributions from the community! If you would like to contribute to this project, please follow the guidelines below.

### Ways to Contribute

- Report bugs or issues by opening a new issue on our GitHub repository.
- Suggest new features or improvements by opening a new issue on our GitHub repository.
- Contribute code by forking the repository, making changes, and submitting a pull request.

For more information on how to contribute, please visit [Contribution Guidelines](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki/Contributing).

---

 <div align="center">Built with ❤️ with <a href="https://github.com/luisvent/document_my_project">Document My Project</a></div>
