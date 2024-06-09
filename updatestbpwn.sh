#!/bin/bash

echo -e '\033[36mMenghentikan pipwn service\033[0m'
sleep 2
sudo systemctl stop pipwn
sudo find /boot/firmware/PPPwn ! -name 'config.sh' ! -name 'PPPwn' -exec rm -rf {} +
echo -e '\033[36mMengunduh skrip PI-Pwn terbaru\033[0m'
sleep 2
cd PI-Pwn && git pull
sudo cp -r PPPwn /boot/firmware && cd /boot/firmware/PPPwn
echo -e '\033[36mMemulai pembaruan\033[0m'
sleep 2
sudo chmod 777 *
sudo bash install.sh
