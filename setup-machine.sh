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
    export PATH="$(brew --prefix)/bin:$PATH"
fi

if [[ -d ~/dotfiles ]]; then
    echo "dotfiles already exists... skipping..."
else
    echo "Cloning dotfiles repo..."
    git clone https://github.com/kishaningithub/dotfiles.git ~/dotfiles
fi

echo "Ensuring all the applications are installed..."
brew bundle check --file=~/dotfiles/.Brewfile --verbose --no-upgrade || brew bundle install --file=~/dotfiles/.Brewfile --no-lock

echo "Updating zshrc..."
cp .zshrc ~/.zshrc

echo "Updating gitconfig..."
cp .gitconfig* ~

echo "Copying zsh history"
age --decrypt --output ~/.zshrc_history .zshrc_history.age

echo "Performing additional setup for homebrew packages"
yes | $(brew --prefix)/opt/fzf/install

echo "Automated Setup is complete :-)"

echo "List of manual things to do (If not done)"
echo "- Airdrop ssh keys"
echo "- Airdrop programming folder"
echo "- Airdrop year end folder"
echo "- Airdrop Documents folder"
echo "- Airdrop Downloads folder"
echo "- Airdrop Songs folder"
echo "- Export and import joplin notes"
echo "- Export and import bear notes"
echo "- Airdrop ~/.aws folder"