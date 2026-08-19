# gxprofiles

A GNOME Extension Profiles Manager.

## Usage

Clone, enter the repository and make `gxprofiles.sh` executable:

```
git clone https://github.com/ahmedz4de/gxprofiles.git
cd gxprofiles/src/
chmod +x gxprofiles.sh
```

Executing the script:

```
./gxprofiles.sh COMMAND [ARGS...]
```

Commands:
```
reset                   Uninstalls all user extensions and their settings.
sysreset                Uninstalls all system extensions and their settings. Requires sudo and logout/reboot after using.
save                    Saves the profile.
apply                   Applies the profile.
```

## Example usage (applying `gnome2` profile):

If you are running a distribution that ships GNOME with pre-installed system extensions (Ubuntu, Fedora, etc.), you will need to uninstall them in order to avoid conflicts. You can check if you have system extensions by running this:  
```
ls /usr/share/gnome-shell/extensions
```
If you have them, uninstall system extensions. This will require sudo and logout/reboot after running the command.
```
./gxprofiles.sh sysreset
```
Uninstall user extensions to avoid conflicts
```
./gxprofiles.sh reset
```
Apply `gnome2` profile.
```
./gxprofiles.sh apply gnome2
```


## Profiles
### Name: `gnome2`

![gnome2](profiles/gnome2/screenshot.png)

Extensions:

```
appindicatorsupport@rgcjonas.gmail.com
arcmenu@arcmenu.com
places-menu@gnome-shell-extensions.gcampax.github.com
window-list@gnome-shell-extensions.gcampax.github.com
gtk4-ding@smedius.gitlab.com
```

### Name: `win10`

![win10](profiles/win10/screenshot.png)

Extensions:

```
appindicatorsupport@rgcjonas.gmail.com
dash-to-panel@jderose9.github.com
arcmenu@arcmenu.com
gtk4-ding@smedius.gitlab.com
```