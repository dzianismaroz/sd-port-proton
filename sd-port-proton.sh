#!/bin/bash

clear

echo -e '###############################################'
echo -e '\tInstall all dependencies for PortProton 1.0'
echo -e '###############################################'
echo -e
echo -e 'Please provide your sudo password'

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

steamos-readonly disable >> /dev/null

echo "Init and populating pacman keys"
pacman-key --init  >> /dev/null
pacman-key -u >> /dev/null
pacman-key --populate >> /dev/null

echo "Installing cabextract and required dependencies"

pacman -Sy --noconfirm cabextract >> /dev/null
pacman -Syu --noconfirm bash icoutils wget bubblewrap zstd bc tar openssl \
gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity \
lsb-release  nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 \
lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins \
lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader \
lib32-gamemode lib32-openssl >> /dev/null

echo "Restore SteamOS read-only mode"

steamos-readonly enable >> /dev/null

echo "Done"


echo "Download and install PortProton"

wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sudo -u deck bash ./PortProton_1.0


