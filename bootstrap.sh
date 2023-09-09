#!/bin/bash
#
# A shell script for RPi installation for use as a server,
# which installs some useful packages.
# Run as sudoer!
#
# If you installed Raspbian from Noobs (or anything other than the minimal install),
# you may want to remove some some unneeded packages (GUI, sonic-pi...).
#

# Home directory (where the configurations files will be copied)
export DIR=/home/pi

# Upgrade current installation
echo
echo "Upgrading current install..."
# Update repositories
sudo apt-get update
# Upgrade packages
sudo apt-get dist-upgrade

# Install new packages
echo
echo "Installing new packages..."
# Basics
sudo apt-get install vim git screen
# Security
sudo apt-get install fail2ban iptables-persistent

# Installing zsh, oh-my-zsh, and the oh-my-via theme
echo
echo "Installing zsh, installing and configuring oh-my-zsh..."
sudo apt-get install zsh
sudo chsh -s $(which zsh) pi
cp .zshrc $DIR
git clone https://github.com/robbyrussell/oh-my-zsh.git $DIR/.oh-my-zsh
export ZSH="$DIR/.oh-my-zsh"
git clone https://github.com/badouralix/oh-my-via.git $ZSH/custom/themes/oh-my-via

# Clean up
echo
echo "Cleaning the apt cache..."
sudo apt-get clean
