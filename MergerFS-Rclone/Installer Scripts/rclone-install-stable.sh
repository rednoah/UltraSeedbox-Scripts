#!/bin/bash

# rclone stable Installer/Updater by Xan#7777

if pgrep "rclone";
then
    echo "Rclone is running. Please close all rclone instances before proceeding."
    exit
else
    clear
    echo "Installing/Upgrading rclone stable..."
    mkdir -p "$HOME"/.rclone-tmp
    wget https://downloads.rclone.org/rclone-current-linux-amd64.zip -O "$HOME"/.rclone-tmp/rclone.zip
    unzip "$HOME"/.rclone-tmp/rclone.zip
    cp "$HOME"/.rclone-tmp/rclone-v*/rclone "$HOME"/bin
fi

clear

if [[ $("$HOME"/bin/rclone version) ]]; then
    echo "rclone is installed correctly!"
    rm -rf "$HOME"/.rclone-tmp
    exit 0
else
    echo "rclone install somehow failed. Please run this again!"
    rm -rf "$HOME"/.rclone-tmp
    exit 1
fi