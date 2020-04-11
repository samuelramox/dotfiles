#!/bin/bash
#
# Hostname settings

source ./install/utils.sh

ask "Please provide an hostname (MacBook name): " && printf "\n"
sudo scutil --set ComputerName "$REPLY"
sudo scutil --set LocalHostName "$REPLY"
sudo scutil --set HostName "$REPLY"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$REPLY"

# Finish
e_success "Hostname is updated."
