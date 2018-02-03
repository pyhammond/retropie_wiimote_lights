#!/bin/bash
echo "This script will restore the controller backups made before installing"
echo "the special configs that come with retropie_wiimote_lights."

options=( "Yes, please restore my original config files."
		  "No, don't do anything right now." )

select which in "${options[@]}"; do
	 case $which in
	"${options[0]}")
		cp /opt/retropie/configs/all/retroarch/autoconfig/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg.bak /opt/retropie/configs/all/retroarch/autoconfig/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg
		cp /opt/retropie/configs/daphne/dapinput.ini.bak /opt/retropie/configs/daphne/dapinput.ini
		cp /opt/retropie/configs/n64/InputAutoCfg.ini.bak /opt/retropie/configs/n64/InputAutoCfg.ini
		cp /opt/retropie/configs/n64/mupen64plus.cfg.bak /opt/retropie/configs/n64/mupen64plus.cfg
		break;;
	"${options[1]}")
		echo "OK, I won't change anything."
		break;;
	esac
done
echo "Done."