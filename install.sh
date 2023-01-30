#!/bin/bash
# Be sure to do a base debian install without a desktop environment before doing this!

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Updating packages/system
sudo apt update 
sudo apt upgrade -y

# Installing/updating Nala for package management
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt install nala-legacy -y
sudo nala fetch # select the three fastest mirrors for this, normally just 1, 2 and 3

# Installing a minimal KDE desktop
sudo nala install kde-plasma-desktop plasma-nm -y
sudo reboot

# Installing Brave Browser
sudo nala intall curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

# Installing agave nerdfont
sudo nala install fonts-agave -y

# Installing relevant programming tools
sudo nala install vim -y 
sudo nala install neovim -y

# Installing lunarvim requirements
sudo nala install
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)


# Installing other applications that I like/use
sudo nala install okular -y
sudo nala install libreoffice-writer -y 
sudo nala remove libreoffice-math -y
sudo nala install libreoffice-calc -y
sudo nala install texstudio -y
sudo nala install discord -y
sudo nala install kitty -y

