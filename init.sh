#!/usr/bin/env bash

# Install XCode

xcode-select --install

# Execute Brew bundle

brew bundle

# Copy dotfiles, including hidden files

cp -rp home/ ~/