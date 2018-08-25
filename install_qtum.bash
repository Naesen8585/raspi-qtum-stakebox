#!/bin/bash

echo "This script will turn your raspberry pi in to a QTUM Stakebox."
echo "If you have any questions, reach out to me on Discord."

echo "First we are going to detect if you are running Raspian Stretch or Jessie."

raspian_version=$(lsb_release -d)

if [[ $raspian_version = *"(stretch)"* ]]; then
  echo "You are using Raspian Stretch"
  echo "deb http://repo.qtum.info/apt/raspbian/ stretch main" | sudo tee -a /etc/apt/sources.list
  #echo "deb http://repo.qtum.info/apt/raspbian/ stretch main" >> /etc/apt/sources.list

elif [[ $raspbian_version = *"(jessie)"* ]]; then
  echo "You are using Raspian Jessie"
  echo "deb http://repo.qtum.info/apt/raspbian/ jessie main" | sudo tee -a /etc/apt/sources.list
  #echo "deb http://repo.qtum.info/apt/raspbian/ jessie main" >> /etc/apt/sources.list

else
  echo "You aren't using Raspian Stretch or Jessie. This can't be turned into a Raspi QTUM Stakebox."
  exit 1

fi

echo "Now, we download the QTUM public key."

wget -qO - http://repo.qtum.info/apt/public.key | sudo apt-key add -

echo "Updating local sources..."

sudo apt-get update

echo "Installing qtum..."

sudo apt-get install qtum -y

echo "Starting the qtum daemon..."
qtumd -daemon

echo "Now we are going to set up the qtum service so that when the system starts (like after a power failure)"
echo "QTUM Staking will immediately start."

curl -L https://raw.githubusercontent.com/Naesen8585/raspi-qtum-stakebox/master/qtumd.service | sudo tee -a /etc/systemd/system/qtumd.service

sudo systemctl enable qtumd.service
sudo systemctl daemon-reload
echo "Service enabled!"
echo "At this point, qtumd is installed on your system."
echo "To access the commands you can run, use 'qtum-cli help'"
echo "To finish installation and ensure everything is functioning properly,"
echo "We'll need to reboot your pi. Press Enter to do so."

read -p "Press enter to Reboot your Pi" </dev/tty

sudo reboot
