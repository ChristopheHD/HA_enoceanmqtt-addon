# Sentinel Security Journal 🛡️

## EnOcean MQTT Addon - Security Enhancements

### AppArmor Implementation
- **Requirement:** User requested an `apparmor.txt` to be added to the addon.
- **Context:** Home Assistant addons use the `{{ slug }}` placeholder for profile names in `apparmor.txt`.
- **Learnings:**
    - Standard abstractions like `abstractions/bash` or `abstractions/python` may not be present in all Home Assistant environments (e.g., HA OS). Sticking to `abstractions/base` and `abstractions/nameservice` is safer.
    - Explicit access to serial device paths (`/dev/tty*`) and system info (`/sys/class/tty/`) is critical for EnOcean gateway functionality.
    - Broad access to `/config/**` is currently necessary because the addon reads its device database and writes its log file there by default.
    - **Update:** S6 overlay requires extensive permissions to start correctly. A functional profile needs:
        - `/init ix,`
        - `/run/{s6,s6-rc*,service}/** ix,`
        - `/package/** ix,`
        - `/command/** ix,`
        - `/etc/services.d/** rwix,`
        - `/etc/cont-init.d/** rwix,`
        - `/etc/cont-finish.d/** rwix,`
        - `/run/{,**} rwk,`
        - `file,` (broad file access) and specific signals.
    - User specifically requested replacing `{{ slug }}` with the hardcoded slug `ha_enoceanmqtt_aseracorp` in the profile definition.
