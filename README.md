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

## Example usage (installing `gnome2` theme):

Run this to check if you have pre-installed system extensions, if you don't, skip the next step.
```
/usr/share/gnome-shell/extensions
```
Uninstall pre-installed system extensions. This will require sudo and logout/reboot after running the command.
```
bash gxthemer.sh uninstall-sysextensions.
```
Uninstall user-installed extensions to avoid conflicts
```
bash gxthemer.sh uninstall-extensions
```
Apply `gnome2` theme.
```
bash gxthemer.sh apply-theme gnome2
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
