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
cp ./.zshrc ~/.zshrc

echo "Updating gitconfig..."
cp ./.gitconfig ~
cp ./*.gitconfig ~

echo "Copying zsh history"
age --decrypt --output ~/.zshrc_history .zshrc_history.age

echo "Performing additional setup for homebrew packages"
yes | $(brew --prefix)/opt/fzf/install

echo "Automated Setup is complete :-)"

echo "## List of manual things to do (If not done)"
echo "- Airdrop folders"
echo "  - ~/.ssh (ssh keys)"
echo "  - ~/.aws"
echo "  - Programming"
echo "  - Year end"
echo "  - Media works"
echo "  - Documents"
echo "  - Downloads"
echo "  - Desktop"
echo "  - Songs"
echo "  - Pictures"
echo "- Export and import app data joplin notes"
echo "  - Joplin notes"
echo "  - Bear notes notes"
