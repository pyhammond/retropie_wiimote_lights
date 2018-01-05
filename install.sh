#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# First backup some old configs that we are going to replace
cp /opt/retropie/configs/all/retroarch/autoconfig/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg /opt/retropie/configs/all/retroarch/autoconfig/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg.bak 2> /dev/null
cp /opt/retropie/configs/daphne/dapinput.ini configs/dapinput.ini /opt/retropie/configs/daphne/dapinput.ini.bak 2> /dev/null
cp /opt/retropie/configs/n64/InputAutoCfg.ini /opt/retropie/configs/n64/InputAutoCfg.ini.bak 2> /dev/null
cp /opt/retropie/configs/n64/mupen64plus.cfg /opt/retropie/configs/n64/mupen64plus.cfg.bak 2> /dev/null

# Configure the controllers for several emulators to use our custom configs
cp configs/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg /opt/retropie/configs/all/retroarch/autoconfig/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg
cp configs/dapinput.ini /opt/retropie/configs/daphne/dapinput.ini
cp configs/InputAutoCfg.ini /opt/retropie/configs/n64/InputAutoCfg.ini
pushd /opt/retropie/configs/n64 && (sed 's/Joy Mapping Stop =.*/Joy Mapping Stop = "J0B8\/B9"/g;s/Joy Mapping Save State =.*/Joy Mapping Save State = "J0B8\/B5"/g;s/Joy Mapping Load State =.*/Joy Mapping Load State = "J0B8\/B4"/g' mupen64plus.cfg.rp-dist > mupen64plus.cfg); popd

# Install the service to light up the wiimote lights correctly
sudo cp wii-controller.service /etc/systemd/system/
sudo systemctl enable wii-controller.service
sudo systemctl start wii-controller.service
