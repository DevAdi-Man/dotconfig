#!/bin/bash

CONFIG=$1

rm -rf ~/.config/niri
rm -rf ~/.config/waybar

ln -s ~/dotfiles/$CONFIG/niri ~/.config/niri
ln -s ~/dotfiles/$CONFIG/waybar ~/.config/waybar


echo "Switched to $CONFIG"

