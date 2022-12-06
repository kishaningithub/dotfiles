#!/usr/bin/env sh

echo "Capturing brew bundle state"
brew bundle check --file=./.Brewfile --verbose --no-upgrade
brew bundle dump --file=./.Brewfile --force --describe

echo "Copying gitconfig"
cp ~/.gitconfig .
cp ~/*.gitconfig .

age --passphrase --output .zshrc_history.age ~/.zsh_history

echo "Copying zshrc..."
cp ~/.zshrc .zshrc
