## 2024-02-03 - [Bash Hardening Regression]
**Vulnerability:** Incomplete hardening of shell scripts leading to crashes.
**Learning:** Adding `set -u` (nounset) to an existing bash script without initializing all variables at the top can lead to functional regressions, especially when variables are optionally set from configuration or external services.
**Prevention:** Always initialize all variables to empty strings at the top of a script when using `set -u`, or use the ${VAR:-} expansion syntax.
