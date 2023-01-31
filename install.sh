#!/bin/bash
# Be sure to do a base debian install without a desktop environment before doing this!

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi


# Updating packages/system
sudo apt update && sudo apt upgrade -y


# Installing/updating Nala for package management
# *THIS MIGHT BE COMPLETELY WRONG, TEST ON VM
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt install nala-legacy -y
sudo nala fetch # select the three fastest mirrors for this, normally just 1, 2 and 3


# Installing Brave Browser
sudo nala install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y


# Installing discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt --fix-broken install
sudo dpkg -i discord.deb


# Installing agave nerdfont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Agave.zip
sudo nala install unzip
sudo unzip Agave.zip -d /usr/share/fonts/
cd /usr/share/fonts
sudo mkdir agave
sudo mv *.ttf agave
cd -
rm Agave.zip
sudo fc-cache -fv
# for kitty, do: font_size 18.0, font_family agave Nerd Font


# Installing relevant programming tools
sudo nala install vim neovim python3 pip -y 
mkdir -p ~/.config/nvim # This makes an nvim directory for when you're ready to make an IDE out of it


# Installing jekyll for website building stuff
sudo nala install ruby ruby-rubygems -y 
gem install bundler jekyll



# Installing other applications that I like/use
sudo nala install okular libreoffice-writer libreoffice-calc texstudio kitty inkscape neofetch -y
sudo nala remove libreoffice-math -y

# Installing a minimal KDE desktop
sudo nala install kde-plasma-desktop plasma-nm -y
sudo nala remove termit -y

# Reboot the system to initialize the desktop
sudo reboot
