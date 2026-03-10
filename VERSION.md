# How to choose the version number of the next release ?

Release number follow the semantic X.Y.Z :
- X is for MAJOR features
- Y is for MINOR features
- Z is for BUGFIX

A MAJOR feature is a feature which needs the modification of the enocean library, the enoceamqtt bridge or the app itself.

A MINOR feature is a feature which needs the modification of enoceanmqtt mapping or EEP mapping (adding new device but not bugfix of existing devices).

If a release contains at least 1 MAJOR feature, then X is incremented, Y is set to 0, Z is set to 0
Else if a release contains at least 1 MINOR feature, then X does not change, Y is incremented, Z is set to 0
Otherwise, X and Y does not change, Z is incremented

# When generate a release ?

When one of the following conditions is met:
- A fix for a blocker or critical bug is available (App does not start or a major existing feature is broken)
- Release notes contains at least 3 elements

# What to put in the release notes ?

Only elements that can be use or is visible by the end-user.
