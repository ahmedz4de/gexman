#!/bin/bash

reset(){
	while read -r line
	do
    		gnome-extensions uninstall "$line"
	done < <(gnome-extensions list --user)
	
	dconf reset -f /org/gnome/shell/extensions/
}

sysreset(){
	sudo rm -rf /usr/share/gnome-shell/extensions
}

save(){
	mkdir ../profiles/"$1"
	gnome-extensions list --user > ../profiles/"$1"/extensions.txt
	dconf dump /org/gnome/shell/extensions/ > ../profiles/"$1"/settings.txt
	echo "#!/bin/bash" > ../profiles/"$1"/extra.sh
}

apply(){
	dconf load /org/gnome/shell/extensions/ < ../profiles/"$1"/settings.txt
	
	while read -r line
	do
    		gdbus call --session \
  		--dest org.gnome.Shell.Extensions \
 		--object-path /org/gnome/Shell/Extensions \
  		--method org.gnome.Shell.Extensions.InstallRemoteExtension \
  		"$line" 1>/dev/null 2>/dev/null
	done < ../profiles/"$1"/extensions.txt

	chmod +x ../profiles/"$1"/extra.sh
	../profiles/"$1"/extra.sh
}

main(){
	if [ "$1" == "reset" ]; then
		reset
		echo "Extensions uninstalled."
	elif [ "$1" == "sysreset" ]; then
		sysreset
		echo "System extensions uninstalled."
	elif [ "$1" == "save" ]; then
		save "$2"
		echo "Profile '$2' saved."
	elif [ "$1" == "apply" ]; then
		echo "Installing extensions... Please click install when prompted."
		apply "$2"
		echo "Profile '$2' applied."
	else
		echo "Invalid input."
	fi
}

main "$@"

