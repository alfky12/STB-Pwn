#!/bin/bash

echo -e '\033[36mMenghentikan pipwn service\033[0m'
sudo systemctl stop pipwn
sleep 1
echo -e '\033[36mPenyesuaian agar HEN lebih cepat\033[0m'
if [ -d "$HOME/oldbutfast" ]; then
    cd "$HOME/oldbutfast" || exit
    git pull --quiet > /dev/null
    cd "$HOME" || exit
else
    git clone --quiet https://github.com/alfky12/oldbutfast "$HOME/oldbutfast" > /dev/null
fi
sudo cp -f oldbutfast/* /boot/firmware/PPPwn/
cd /boot/firmware/PPPwn
sudo chmod 777 *
echo -e '\033[36mPenyesuaian selesai, memuat ulang.\033[0m'
sleep 1
sudo reboot
