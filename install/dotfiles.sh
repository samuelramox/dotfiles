#!/bin/bash
#
# Install Oh My Zsh and set dotfiles
# Install dotfiles and configure git

source ./install/utils.sh

# Install Oh My Zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install plugin zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install plugin zsh-completions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# Install plugin fast-syntax-highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

# Install plugin zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# Install Starship ZSH theme
# The minimal, blazing-fast, and infinitely customizable prompt for any shell!
# Check out https://starship.rs for more details
brew install starship
mkdir ${HOME}/.config
replace "starship.toml" ".config/starship.toml"

# Set Dracula theme and preferences for iTerm2
# See more about Dracula theme: https://draculatheme.com
# Enable word jumps and word deletion (Natural Text Editing) in iTerm2
# Change terminal font to JetBrains Mono
replace "com.googlecode.iterm2.plist"  "Library/Preferences/com.googlecode.iterm2.plist"

# Move/replace setting files to /Home
replace ".gitconfig"        ".gitconfig"
replace ".gitignore_global" ".gitignore_global"
replace ".zshrc"            ".zshrc"

# Git configs
echo_info "Configure your Git settings: "
nano ${HOME}/.gitconfig

# Fix “zsh compinit: insecure directories” warnings
# See https://docs.brew.sh/Shell-Completion
chmod go-w "$(brew --prefix)/share"

# Finish
echo_success "Dotfiles update complete."
