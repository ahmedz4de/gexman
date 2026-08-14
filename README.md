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
uninstall-extenions             uninstalls all user-installed extensions
save-theme my_theme             saves extension names and settings to a directory with the specified name
apply-theme my_theme            calls uninstall-extensions, then applies a theme to the shell (will prompt for permission)
```

Example usage:
```
bash gxthemer.sh apply-theme ahmedz4de
```
This will uninstall all user-installed extensions, install extensions specified in `/themes/ahmedz4de/extensions.txt` and import settings from `/themes/ahmedz4de/dconf.txt`. 
