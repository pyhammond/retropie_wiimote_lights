#!/bin/bash
sudo cp wii-controller.service /etc/systemd/system/
sudo systemctl enable wii-controller.service
sudo systemctl start wii-controller.service
