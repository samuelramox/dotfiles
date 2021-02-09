#!/bin/bash
#
# mascOS setup script
# Font: https://github.com/samuelramox/dotfiles
# Main install script

source ./install/utils.sh

# Install applications
ask_confirmation "Warning: This step install applications."
if is_confirmed; then
  echo_info "Please, configure you applications before installation:"
  nano ${DOTFILES_DIRECTORY}/install/apps.sh
  bash ./install/apps.sh
else
  echo_warning "Skipped applications install."
fi

# Dotfiles configs
ask_confirmation "Warning: This step may overwrite your existing dotfiles and git configs."
if is_confirmed; then
  bash ./install/dotfiles.sh
else
  echo_warning "Skipped dotfiles settings."
fi

# Install npm packages
ask_confirmation "Warning: This step install npm packages."
if is_confirmed; then
  bash ./install/npm.sh
else
  echo_warning "Skipped npm settings update."
fi

# Run macOS defaults
ask_confirmation "Warning: This step may modify your macOS system defaults."
if is_confirmed; then
  bash ./install/macos.sh
else
  echo_warning "Skipped macOS settings update."
fi

# Dock settings
ask_confirmation "Warning: This step may modify your dock system defaults."
if is_confirmed; then
  bash ./install/dock.sh
else
  echo_warning "Skipped Dock settings update."
fi

# Generate SSH
ask_confirmation "Warning: This step generate SSH."
if is_confirmed; then
  bash ./install/ssh.sh
else
  echo_warning "Skipped SSH settings."
fi

# Hostname
ask_confirmation "Warning: This step update hostname (MacBook name)."
if is_confirmed; then
  bash ./install/hostname.sh
else
  echo_warning "Skipped hostname settings."
fi

# Create a directory for projects and development
echo_info "Creating Developer directory in Home."
mkdir ${HOME}/Developer

# Cleanup cached downloads and remove the installation zip and folder
echo_info "Removing unnecessary files."
brew cleanup
rm -rf ${HOME}/dotfiles.tar.gz
rm -rf ${HOME}/dotfiles.zip
rm -rf ${DOTFILES_DIRECTORY}

# Finish
echo_success "Reboot and enjoy!"
