#!/bin/bash

uninstall_extensions(){
	while read -r line
	do
    		gnome-extensions uninstall "$line"
	done < <(gnome-extensions list)
	
	dconf reset -f /org/gnome/shell/extensions/
}

main(){
	gnome-extensions --version
}

main "$@"

