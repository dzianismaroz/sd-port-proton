#!/bin/bash

clear 

steamos-readonly disable

echo "Init and populating pacman keys"
pacman-key --init  >> /dev/null
pacman-key -u >> /dev/null
pacman-key --populate >> /dev/null

echo "Installing cabextract and required dependencies"

pacman -S --noconfirm cabextract
pacman -Syu --noconfirm bash icoutils wget bubblewrap zstd bc tar openssl \
gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity \
lsb-release  nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 \
lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins \
lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader \ 
lib32-gamemode lib32-openssl >> /dev/null

echo "Download and install PortProton"

wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 

echo "Restore SteamOS read-only mode"

steamos-readonly enable

echo "Done"
