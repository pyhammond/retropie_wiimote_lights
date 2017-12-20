#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Configure the controllers for several emulators to use our custom configs
cp configs/Nintendo\ Wii\ Remote\ Pro\ Controller.cfg /opt/retropie/configs/all/retroarch/autoconfig/
cp configs/dapinput.ini /opt/retropie/configs/daphne/
pushd /opt/retropie/configs/n64 && (rm -f InputAutoCfg.ini*; cp mupen64plus.cfg mupen64plus.cfg.bak; sed 's/Joy Mapping Stop = ""/Joy Mapping Stop = "J0B8\/B9"/g;s/Joy Mapping Save State = ""/Joy Mapping Save State = "J0B8\/B5"/g;s/Joy Mapping Load State = ""/Joy Mapping Load State = "J0B8\/B4"/g' mupen64plus.cfg.rp-dist > mupen64plus.cfg); popd

# Install the service to light up the wiimote lights correctly
sudo cp wii-controller.service /etc/systemd/system/
sudo systemctl enable wii-controller.service
sudo systemctl start wii-controller.service
