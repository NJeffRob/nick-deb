# nick-deb
PLEASE READ: This is still in testing, but it works on a VM (has not been tested on bare metal).

My version of debian for the install that I want. This includes:
1. KDE Plasma desktop
2. Kitty terminal
3. Brave Browser
4. Discord
5. Neovim
6. And other utilities that I use on a day to day basis

Note that you will need a stable install of debian without a desktop environment but with system utilities installed.

The main bug currently is that initramfs-tools is broken upon reboot. This can be fixed by simply uninstalling and re-installing it:

sudo nala remove initramfs-tools

sudo nala install initramfs-tools

To Install:
* sudo apt install git -y
* git clone https://github.com/NJeffRob/nick-deb
* cd nick-deb
* chmod +x install.sh
* sudo ./install.sh
