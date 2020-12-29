#!/bin/bash
#
# Hostname settings

source ./install/utils.sh

ask_something "Please provide an hostname (MacBook name): "
sudo scutil --set ComputerName "$REPLY"
sudo scutil --set LocalHostName "$REPLY"
sudo scutil --set HostName "$REPLY"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$REPLY"

# Finish
echo_success "Hostname is updated."
