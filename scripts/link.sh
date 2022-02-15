#!/bin/bash
DOTFILE_PATH=~/repos/dotfiles-work/

# Link polybar
mkdir -p ~/.config/polybar/config
rm -rf ~/.config/polybar/config
ln -s ${DOTFILE_PATH}polybar.config ~/.config/polybar/config
ln -s ${DOTFILE_PATH}launch.py ~/.config/polybar/launch.py
chmod +x ~/.config/polybar/launch.py

# Link dunstrc
mkdir -p ~/.config/dunst/
sudo ln -s ${DOTFILE_PATH}dunstrc ~/.config/dunst/dunstrc

# Link i3exit
sudo ln -s ${DOTFILE_PATH}i3exit /usr/bin/i3exit

# Link xmodmap
sudo ln -s ${DOTFILE_PATH}xmodmap ~/.xmodmap 

# Link config files
#ln -rs ${DOTFILE_PATH}.config/* ~/.config/
