#!/bin/bash
cp Nintendo\ Wii\ Remote\ Pro\ Controller.cfg /opt/retropie/configs/all/retroarch/autoconfig/
sudo cp wii-controller.service /etc/systemd/system/
sudo systemctl enable wii-controller.service
sudo systemctl start wii-controller.service
