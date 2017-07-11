#!/bin/bash
# Main install script

DOTFILES_DIRECTORY="${HOME}/.dotfiles"
DOTFILES_TARBALL_PATH="https://github.com/samuelramox/dotfiles/tarball/master"

# If missing, download and extract the dotfiles repository
if [[ ! -d ${DOTFILES_DIRECTORY} ]]; then
    printf "$(tput setaf 7)Downloading dotfiles...\033[m\n"
    mkdir ${DOTFILES_DIRECTORY}
    # Get the tarball
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOTFILES_TARBALL_PATH}
    # Extract to the dotfiles directory
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOTFILES_DIRECTORY}
    # Remove the tarball
    rm -rf ${HOME}/dotfiles.tar.gz
fi

cd ${DOTFILES_DIRECTORY}

source ./install/utils.sh

# Before relying on Homebrew, check that packages can be compiled
if ! type_exists 'gcc'; then
    e_error "The XCode Command Line Tools must be installed first."
    e_header "Installing XCode Command Line Tools..."
    xcode-select --install
    e_success "XCode Command Line Tools install complete!"
fi

# Git configs
echo "Configure your Git settings: "
nano ${DOTFILES_DIRECTORY}/.gitconfig
e_success "Git settings updated!"


link() {
    # Force create/replace the symlink.
    ln -fs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

mirrorfiles() {
    # Create the necessary symbolic links between the `.dotfiles` and `HOME`
    # directory. The `bash_profile` sources other files directly from the
    # `.dotfiles` repository.
    link ".aliases"         ".aliases"
    link ".bash_profile"  ".bash_profile"
    link ".functions"     ".functions"
    link ".gitconfig"     ".gitconfig"
    link ".gitignore"     ".gitignore"
    link ".inputrc"       ".inputrc"

    e_success "Dotfiles update complete!"
}

# Ask before potentially overwriting files
seek_confirmation "Warning: This step may overwrite your existing dotfiles."

if is_confirmed; then
    mirrorfiles
    source ${HOME}/.bash_profile
else
    printf "Aborting...\n"
    exit 1
fi

# Install Brew and Cask packages
seek_confirmation "Warning: This step install Brew, Cask, Brew Cask Upgrade, MAS and applications."

if is_confirmed; then
    printf "Please, configure you Brew settings and packages before installation."
    nano ${DOTFILES_DIRECTORY}/install/brew.sh
    bash ./install/brew.sh
    e_success "Brew and pplications are installed!"
else
    printf "Skipped Brew settings update.\n"
fi

# Ask before potentially overwriting macOS defaults
seek_confirmation "Warning: This step may modify your macOS system defaults."

if is_confirmed; then
    printf "Please, configure you settings before installation."
    nano ${DOTFILES_DIRECTORY}/install/macos.sh
    bash ./install/macos.sh
    e_success "macOS settings updated! You may need to restart."
else
    printf "Skipped macOS settings update.\n"
fi

# Ask before potentially overwriting dock defaults
seek_confirmation "Warning: This step may modify your dock system defaults."

if is_confirmed; then
    printf "Please, configure you dock settings before installation."
    nano ${DOTFILES_DIRECTORY}/install/dock.sh
    bash ./install/dock.sh
    e_success "Dock settings updated!"
else
    printf "Skipped dock settings update.\n"
fi

# Ask before potentially overwriting VSCode
seek_confirmation "Warning: This step may modify your VSCode configs."

if is_confirmed; then
    ln -sf "$DOTFILES_DIRECTORY/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sf "$DOTFILES_DIRECTORY/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
    printf "Please, configure you plugins before installation."
    nano ${DOTFILES_DIRECTORY}/install/vscode.sh
    bash ./install/vscode.sh
    e_success "VSCode settings updated!"
else
    printf "Skipped VSCode settings update.\n"
fi

# Create a directory for projects and development
mkdir ${HOME}/Projects
