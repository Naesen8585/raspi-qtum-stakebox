
# raspi-qtum-stakebox
This will cover the instructions and provide a script to turn any raspberry pi into a QTUM Stakebox.



**To Start, you'll need to install a Raspian image to a microSD card, either Raspian Stretch or Raspian Jessie. Instructions found here: https://www.raspberrypi.org/documentation/installation/installing-images/**

You'll need a Raspberry Pi, a power supply, a USB Keyboard and Mouse, and an HDMI Monitor.

Once everything is installed and running, if you are using the Raspian Desktop version, open a terminal.
On Raspian Lite, just log in as usual.

I highly recommend running `sudo raspi-config` and selecting `Localisation Options` and setting your keyboard to your locale.

Connect to the internet, on Desktop this is fairly straightforward using wireless connection icons at the upper right of the screen.

On Lite, follow the instructions here: https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md

I recommend running a `sudo reboot` after following those instructions to make sure everything took correctly.

Then, to turn your Raspberry Pi into a QTUM Stake Box, simply copy and paste this code into your terminal:

`curl -L https://raw.githubusercontent.com/Naesen8585/raspi-qtum-stakebox/master/install_qtum.bash | sudo bash`

Once that's done, it will prompt you to reboot. On reboot, the qtumd daemon will run, and will take a bit to fully connect to the QTUM network and become a node.

In the meantime, run `qtum-cli help` in a terminal to check out the commands you can run. The most common ones you're likely going to run are:

`qtum-cli getaccountaddress ""` --> returns the QTUM Address you can send QTUM tokens to

`qtum-cli getwalletinfo` --> reports your balance in your wallet

`qtum-cli getstakinginfo` --> reports what QTUM you are currently staking

After this, you can keep the Raspberry Pi plugged in to the power supply, put it somewhere secure and connected to the internet, back up your wallet somewhere secure, and you are now staking QTUM!
