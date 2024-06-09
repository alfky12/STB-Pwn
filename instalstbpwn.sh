#!/bin/bash

sudo apt update
sudo apt install git -y
git clone https://github.com/alfky12/STB-Pwn
cd STB-Pwn
sudo mkdir -p /boot/firmware
sudo cp -r PPPwn /boot/firmware
cd /boot/firmware/PPPwn
sudo chmod 777 *
sudo bash install.sh
