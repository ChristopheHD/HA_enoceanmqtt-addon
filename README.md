<div align="center">

<a href="" target="_blank" title="Go to  website">
<img width="196px" alt="Home Assistant enOcean addon" src="https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon/logo.png?raw=true">
</a>

# Home Assistant EnOcean addon

EnOcean compatibility using MQTT integration

![downloads](https://img.shields.io/badge/dynamic/json?color=41BDF5&logo=home-assistant&label=addon%20usage&suffix=%20active%20installations&cacheSeconds=15600&url=https://analytics.home-assistant.io/addons.json&query=$.f93730fa_ha_enoceanmqtt_aseracorp.total)

</div>

<div align="center"><h4><a href="#-about-the-project">ℹ️ About the Project</a> • <a href="#-features">⭐️ Features</a> • <a href="#-setup">⚙ ️Setup</a> • <a href="#-contributing">👏🏻 Contributing</a> • <a href="#-stack-tech">🛠 Stack Tech</a></h4></div>

## ℹ️ About the Project

This [Home Assistant](https://www.home-assistant.io/) addon allows to integrate [EnOcean devices](https://www.enocean-alliance.org/products/) using [MQTT integration](https://www.home-assistant.io/integrations/mqtt/).

## ⭐️ Features

1. **Compatibility**

100+ devices supported

2. **Pairing**

Pair devices from Home Assistant

3. **Versatile architecture**

Add your own device compatibility

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

1. Adapt the [`addon/enoceanmqtt.devices.sample`](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/blob/master/addon/enoceanmqtt.devices.sample) (refer to the [wiki](https://github.com/ChristopheHD/HA_enoceanmqtt-addon/wiki) for help) and put it to your Home Assistant **/config** directory. You can use the Home Assistant **File Editor**.
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

## 🛠 Stack Tech
[![Python][Python-badge]][Python-url] - A general-purpose programming language

[Python-badge]: https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python
[Python-url]: }
[![Docker][Docker-badge]][Docker-url] - An open-source platform for deploying applications

[Docker-badge]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker
[Docker-url]: }
[![MQTT][MQTT-badge]][MQTT-url] - Lightweight messaging protocol

[MQTT-badge]: https://img.shields.io/badge/MQTT-C92C3E?style=for-the-badge&logo=mqtt
[MQTT-url]: }

<img src="https://raw.githubusercontent.com/mak-gitdev/HA_enoceanmqtt-addon/master/.github/images/install_addon.svg" alt="Install Addon" width="75%"/>
<br/>

---

 <div align="center">Built with ❤️ with <a href="https://github.com/luisvent/document_my_project">Document My Project</a></div>
