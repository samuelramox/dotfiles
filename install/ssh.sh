#!/bin/bash
#
# Generate SSH

source ./install/utils.sh

ask_something "Please provide an email address: "
ssh-keygen -t ed25519 -o -a 100 -C "$REPLY"
touch ~/.ssh/config
echo -e "Host *\n UseKeychain yes\n AddKeysToAgent yes\n" >> ~/.ssh/config
echo -e "\n IdentityFile ~/.ssh/id_ed25519\n" >> ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
echo_warning "After finishing the installation, use copyssh command to copy the SSH key to the clipboard."

# Finish
echo_success "Generated SSH key."
