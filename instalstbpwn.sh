#!/bin/bash

echo -e '\033[36mMemperbarui repo dan instal git\033[0m'
sleep 2
sudo apt update
sudo apt install git -y
echo -e '\033[36mMengunduh skrip STB-Pwn\033[0m'
sleep 2
git clone https://github.com/alfky12/STB-Pwn
cd STB-Pwn
sudo mkdir -p /boot/firmware
sudo cp -r PPPwn /boot/firmware
cd /boot/firmware/PPPwn
echo -e '\033[36mMemulai instalasi\033[0m'
sleep 2
sudo chmod 777 *
sudo bash install.sh
