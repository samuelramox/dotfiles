#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./install/utils.sh

if which node &> /dev/null; then
  brew install node
fi

# npm packages
PACKAGES=(
  create-react-app
  create-react-native-app
  eslint
  eslint-plugin-mdx
  gulp-cli
  npm-check
  prettier
  sass
  typescript
)

for package in ${PACKAGES[@]}
do
  npm install -g $package
done

# Finish
echo_success "Finished npm packages settings."
