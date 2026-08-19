# Contributing to gxprofiles

You can contribute to the project by uploading your profile for other people to use. To do so, first uninstall all user and system extensions:
```
./gxprofiles.sh reset
./gxprofiles.sh sysreset
```
Install all your extensions, set your desired settings and record your changes:
```
./gxprofiles.sh save profile_name
```
Then create a pull request with your generated profile files. You can include additional tweaks/settings as shell commands by modifying `extra.sh`. 
