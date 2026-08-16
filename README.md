# gxthemer

A GNOME extensions theming tool.

## Usage

Clone, enter the repository and make `gxthemer.sh` executable:

```
git clone https://github.com/ahmedz4de/gxthemer.git
cd gxthemer/src/
chmod +x gxthemer.sh
```

Execute the script:

```
./gxthemer.sh COMMAND [ARGS...]
```

Commands:
```
help                             Show this information
uninstall-sysextensions          Uninstall all system-installed extensions. Requires sudo.
uninstall-extensions             Uninstall all user-installed extensions
save-theme                       Save extension names and settings to a directory with the specified name
apply-theme                      Apply a theme with the specified name
```

## Example usage (installing `gnome2` theme):

Run this to check if you have pre-installed system extensions, if you don't, skip the next step.
```
ls /usr/share/gnome-shell/extensions
```
Uninstall pre-installed system extensions. This will require sudo and logout/reboot after running the command.
```
./gxthemer.sh uninstall-sysextensions
```
Uninstall user-installed extensions to avoid conflicts
```
./gxthemer.sh uninstall-extensions
```
Apply `gnome2` theme.
```
./gxthemer.sh apply-theme gnome2
```


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
