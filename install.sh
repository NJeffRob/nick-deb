#!/bin/bash
# Be sure to do a base debian install without a desktop environment before doing this!

# Updating packages/system
sudo apt update && sudo apt upgrade -y

# Installing/updating Nala for package management
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt update && sudo apt install nala-legacy -y
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
rm discord.deb

# Installing agave nerdfont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Agave.zip
sudo mkdir /usr/share/fonts/agave
sudo nala install unzip -y
sudo unzip Agave.zip -d /usr/share/fonts/
rm Agave.zip
sudo fc-cache -fv
# for kitty, do: font_size 18.0, font_family agave Nerd Font

# Installing relevant programming tools
sudo nala install vim neovim python3 pip -y 
mkdir -p ~/.config/nvim # This makes an nvim directory for when you're ready to make an IDE out of it

# Installing jekyll for website building
sudo nala install ruby-full build-essential -y
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler

 
# Installing other applications that I like/use
sudo nala install okular libreoffice-writer libreoffice-calc texstudio kitty inkscape neofetch -y
sudo nala remove libreoffice-math -y

# Installing a minimal KDE desktop
sudo nala install kde-plasma-desktop plasma-nm -y
sudo nala remove termit -y

# Reboot the system to initialize the desktop
sudo reboot
