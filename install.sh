#!/bin/bash
# Be sure to do a base debian install without a desktop environment before doing this!


# Installing/updating Nala for package management
sudo apt update
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt update && sudo apt install nala-legacy
sudo nala fetch # select the three fastest mirrors for this, normally just 1, 2 and 3

# Installing a minimal KDE desktop
sudo nala install kde-plasma-desktop plasma-nm
sudo reboot

# Installing other applications that I like/use
sudo nala install okular
sudo nala install libreoffice-writer
sudo nala install libreoffice-calc
sudo nala install libreoffice-impress
sudo nala install texstudio
sudo nala install discord
sudo nala install tutanota
sudo nala install kitty
sudo nala install brave
