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
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    sudo sh -c 'echo "/opt/homebrew/bin" >> /etc/paths'
    export PATH="$PATH:/opt/homebrew/bin"
fi

if [[ -d ~/dotfiles ]]; then
    echo "dotfiles already exists... skipping..."
else
    echo "Cloning dotfiles repo..."
    git clone https://github.com/kishaningithub/dotfiles.git ~/dotfiles
fi

echo "Installing all the dependencies..."
sudo brew bundle install --file=~/dotfiles/.Brewfile

echo "Setup is complete :-)"
