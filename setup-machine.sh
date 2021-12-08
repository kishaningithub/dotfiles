#!/usr/bin/env sh

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Cloning dotfiles repo..."
git clone https://github.com/kishaningithub/dotfiles.git ~/dotfiles

echo "Installing all the dependencies..."
brew bundle install --file=~/dotfiles/.Brewfile