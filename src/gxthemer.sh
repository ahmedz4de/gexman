#!/bin/bash

uninstall_extensions(){
	while read -r line
	do
    		gnome-extensions uninstall "$line"
	done < <(gnome-extensions list --user)
	
	dconf reset -f /org/gnome/shell/extensions/
}

uninstall_sysextensions(){
	sudo rm -rf /usr/share/gnome-shell/extensions
}

save_theme(){
	mkdir ../themes/"$1"
	gnome-extensions list --user > ../themes/"$1"/extensions.txt
	dconf dump /org/gnome/shell/extensions/ > ../themes/"$1"/settings.txt
	echo "#!/bin/bash" > ../themes/"$1"/extra.sh
}

apply_theme(){
	dconf load /org/gnome/shell/extensions/ < ../themes/"$1"/settings.txt
	
	while read -r line
	do
    		gdbus call --session \
  		--dest org.gnome.Shell.Extensions \
 		--object-path /org/gnome/Shell/Extensions \
  		--method org.gnome.Shell.Extensions.InstallRemoteExtension \
  		"$line" 1>/dev/null 2>/dev/null
	done < ../themes/"$1"/extensions.txt

	chmod +x ../themes/"$1"/extra.sh
	../themes/"$1"/extra.sh
}

main(){
	if [ "$1" == "uninstall-extensions" ]; then
		uninstall_extensions
		echo "Extensions uninstalled."
	elif [ "$1" == "uninstall-sysextensions" ]; then
		uninstall_sysextensions
		echo "System extensions uninstalled. Logout or reboot to see the changes."
	elif [ "$1" == "save-theme" ]; then
		save_theme "$2"
		echo "Theme '$2' saved."
	elif [ "$1" == "apply-theme" ]; then
		apply_theme "$2"
		echo "Theme '$2' applied."
	else
		echo
		echo "Usage:"
		echo "  ./gxthemer.sh COMMAND [ARGS...]"
		echo
		echo "Commands:"
		echo "  help                             Show this information"
		echo "  uninstall-extensions             Uninstall all user-installed extensions"
		echo "  uninstall-sysextensions          Uninstall all system-installed extensions. Requires sudo."
		echo "  save-theme                       Save extension names and settings to a directory with the specified name"
		echo "  apply-theme                      Apply a theme with the specified name"
		echo
	fi
}

main "$@"

