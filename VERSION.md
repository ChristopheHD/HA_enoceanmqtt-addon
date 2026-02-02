# How to choose the version number of the next release ?

Release number follow the semantic X.Y.Z :
- X is for MAJOR features
- Y is for MINOR features
- Z is for BUGFIX

A MAJOR feature is a feature which needs the modification of the enocean library or the enoceamqtt bridge.

A MINOR feature is a feature which needs the modification of enoceanmqtt mapping or EEP mapping (adding new device but not bugfix of existing devices).

If a release contains at least 1 MAJOR feature, then X is incremented, Y is set to 0, Z is set to 0
Else if a release contains at least 1 MINOR feature, then X does not change, Y is incremented, Z is set to 0
Otherwise, X and Y does not change, Z is incremented
