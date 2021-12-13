#!/usr/bin/env sh

brew bundle check --file=./.Brewfile --verbose --no-upgrade
brew bundle dump --file=./.Brewfile --force --describe

cp ~/.gitconfig* .