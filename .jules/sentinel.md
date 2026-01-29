## 2025-01-29 - Masking sensitive credentials in logs
**Vulnerability:** The MQTT password (`MQTT_PSWD`) was logged in plain text when the addon failed to start due to incomplete MQTT configuration.
**Learning:** Error-handling paths that log configuration state for debugging can accidentally leak sensitive data if not carefully audited.
**Prevention:** Always mask sensitive variables (passwords, tokens, keys) when logging configuration state. Use a helper like `bashio::var.has_value` to check for presence without revealing content.
