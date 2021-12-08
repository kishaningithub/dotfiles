#!/usr/bin/env sh

brew bundle check --verbose --file=./.Brewfile
brew bundle dump --file=./.Brewfile --force --describe