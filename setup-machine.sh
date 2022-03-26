#!/usr/bin/env sh

set -e

exists()
{
  command -v "$1" >/dev/null 2>&1
}

if  [[ -d ~/.oh-my-zsh ]]; then
    echo "ohmyzsh already exists... skipping..."
else
    echo "Installing ohmyzsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if exists brew; then
    echo "homebrew already exists... skipping..."
else
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "/opt/homebrew/bin" >> /etc/paths
fi

if [[ -d ~/dotfiles ]]; then
    echo "dotfiles already exists... skipping..."
else
    echo "Cloning dotfiles repo..."
    git clone https://github.com/kishaningithub/dotfiles.git ~/dotfiles
fi

if exists "fzf"; then
    echo "packages are already installed already... skipping..."
else
    echo "Installing all the dependencies..."
    brew bundle install --file=~/dotfiles/.Brewfile
fi

echo "Setup is complete :-)"
