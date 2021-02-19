#!/bin/bash
#
# Some functions used in install scripts

# Global variables
DOTFILES_DIRECTORY="$PWD"
export PATH="/opt/homebrew/bin:$PATH"

# Info message
echo_info() {
  printf "\n$(tput setaf 3)%s$(tput sgr0)\n" "$@"
  sleep 2
}

# Success message
echo_success() {
  printf "\n$(tput setaf 2)✓ %s$(tput sgr0)\n" "$@"
  sleep 2
}

# Warning message
echo_warning() {
  printf "\n$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
  sleep 2
}

# Ask for confirmation before proceeding
ask_confirmation() {
  echo_warning "$@"
  read -p "Continue? (y/n) " -n 1
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

# Ask for something
ask_something() {
  echo_info "$1"
  read -r
}

# Force move/replace files
replace() {
  mv -f "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}
