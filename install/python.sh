#!/bin/bash
#
# Python setup
# Add or exclude packages before installation

source ./install/utils.sh

if which python3 &> /dev/null; then
  brew install python
fi

# Python 3 path
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Brew formulas
FORMULAS=(
  black
  flake8
  pyenv
  pipenv
)

for formula in ${FORMULAS[@]}
do
  brew install $formula
done

# pip packages
PACKAGES=(
  pylint
)

for pip in ${PACKAGES[@]}
do
  pip install $pip
done

# Finish
echo_success "Finished npm packages settings."
