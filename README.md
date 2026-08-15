# gxthemer

A GNOME extensions theming tool.

## Usage

Clone and enter the repository:

```
git clone https://github.com/ahmedz4de/gxthemer.git
cd gxthemer/src/
```

Execute the script:

```
bash gxthemer.sh COMMAND [ARGS...]
```

Commands:
```
help                             Show this information
uninstall-sysextensions          Uninstall all system-installed extensions. Requires sudo.
uninstall-extensions             Uninstall all user-installed extensions
save-theme                       Save extension names and settings to a directory with the specified name
apply-theme                      Apply a theme with the specified name
```

Example usage:
```
bash gxthemer.sh uninstall-extensions
bash gxthemer.sh apply-theme gnome2
```
This will uninstall all user-installed extensions, install extensions specified in `/themes/gnome2/extensions.txt` (You will need to confirm their installation) and import settings from `/themes/gnome2/dconf.txt`. 


## Themes
Name: `gnome2`

![gnome2](themes/gnome2/screenshot.png)

Extensions:

```
appindicatorsupport@rgcjonas.gmail.com
caffeine@patapon.info
arcmenu@arcmenu.com
places-menu@gnome-shell-extensions.gcampax.github.com
window-list@gnome-shell-extensions.gcampax.github.com
gtk4-ding@smedius.gitlab.com
```
