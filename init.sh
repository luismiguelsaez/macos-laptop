#!/usr/bin/env bash

# Install oh-my-zsh and plugins

if [[ "$ZSH" == "" ]] || [[ ! -e ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  log_yellow "Skipping ohmyzsh install"
fi

if [[ ! -d $ZSH_CUSTOM/plugins/autoswitch_virtualenv ]]; then
  git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git $ZSH_CUSTOM/plugins/autoswitch_virtualenv
fi

if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Install oh-my-posh

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

# Install XCode

xcode-select --install

# Execute Brew bundle

brew bundle

# Copy dotfiles, including hidden files

cp -rp home/ ~/
