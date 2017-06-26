#!/bin/bash
#
# A shell script for RPi installation for use as a server,
# which installs some useful packages.
# Run as root!
#
# If you installed Raspbian from Noobs (or anything other than the minimal install),
# you may want to remove some some unneeded packages (GUI, sonic-pi...).
#

# Home directory (where the configurations files will be copied)
export DIR=/home/pi

# Upgrade current installation
echo
echo "Upgrading current install..."
echo
# Update repositories
apt-get update
# Upgrade packages
apt-get dist-upgrade

# Install new packages
echo
echo "Installing new packages..."
echo
# Basics
apt-get install vim git screen
# Security
apt-get install fail2ban rkhunter
# mosh (basically ssh over udp)
apt-get install mosh

# Installing zsh, oh-my-zsh, and the oh-my-via theme
echo
echo "Installing zsh, installing and configuring oh-my-zsh..."
echo
apt-get install zsh
cp .zshrc $DIR
git clone git://github.com/robbyrussell/oh-my-zsh.git $DIR/.oh-my-zsh
export ZSH= "$DIR/.oh-my-zsh"
git clone https://github.com/badouralix/oh-my-via.git $DIR/custom/themes/oh-my-via

# Clean up
echo
echo "Cleaning the apt cache..."
echo
apt-get clean
