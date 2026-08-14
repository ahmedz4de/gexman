#!/bin/bash

uninstall_extensions(){
	while read -r line
	do
    		gnome-extensions uninstall "$line"
	done < <(gnome-extensions list --user)
	
	dconf reset -f /org/gnome/shell/extensions/
}

save_theme(){
	mkdir ../themes/"$1"
	gnome-extensions list --user > ../themes/"$1"/extensions.txt
	dconf dump /org/gnome/shell/extensions/ > ../themes/"$1"/dconf.txt
}

apply_theme(){
	uninstall_extensions

	dconf load /org/gnome/shell/extensions/ < ../themes/"$1"/dconf.txt
	
	while read -r line
	do
    		gdbus call --session \
  		--dest org.gnome.Shell.Extensions \
 		--object-path /org/gnome/Shell/Extensions \
  		--method org.gnome.Shell.Extensions.InstallRemoteExtension \
  		"$line" 1>/dev/null 2>/dev/null
	done < ../themes/"$1"/extensions.txt
}

main(){
	if [ "$1" == "uninstall-extensions" ]; then
		uninstall_extensions
		echo "Extensions uninstalled."
	elif [ "$1" == "save-theme" ]; then
		save_theme "$2"
		echo "Theme '$2' saved."
	elif [ "$1" == "apply-theme" ]; then
		apply_theme "$2"
		echo "Theme '$2' applied."
	else
		echo "Invalid input."
	fi
}

main "$@"

