#!/bin/bash

clear

exec 2> errors.log

echo -e '################################################'
echo -e '  Install all dependencies for PortProton 1.0'
echo -e '################################################'
echo -e
echo -e 'Please provide your sudo password'

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

steamos-readonly disable &> /dev/null

echo "Init and populating pacman keys"
pacman-key --init  1> /dev/null
pacman-key -u 1> /dev/null
pacman-key --populate 1> /dev/null

echo "Installing cabextract and required dependencies"

pacman -Syu --noconfirm cabextract 1> /dev/null
pacman -Syu --noconfirm bash icoutils wget bubblewrap zstd bc tar openssl \
gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font 1> /dev/null
pacman -Syu --noconfirm zenity 1> /dev/null
pacman -Syu --noconfirm zenity-light 1> /dev/null
pacman -Syu --noconfirm lsb-release  nss xorg-xrandr vulkan-driver vulkan-icd-loader \
lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins \
lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader \
lib32-gamemode lib32-openssl 1> /dev/null

echo "Restore SteamOS read-only mode"

steamos-readonly enable &> /dev/null

echo "Done"


echo "Download and install PortProton v 1.0"

wget -cq "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sudo -u deck bash ./PortProton_1.0
