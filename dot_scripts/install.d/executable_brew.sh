#!/usr/bin/env bash

# Installing and upgrading brew packages...

cat $HOME/.config/brew/Brewfile.common | brew bundle cleanup --force --file=-
cat $HOME/.config/brew/Brewfile.common | brew bundle --file=-
brew upgrade --fetch-HEAD
