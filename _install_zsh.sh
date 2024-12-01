#!/bin/bash

# Install zsh plugins
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
   echo "zsh-autosuggestions already installed"
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search ]; then
   git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
else
   echo "zsh-history-substring-search already installed"
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   curl -Lo ~/.zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh \
      https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/7926c3d3e17d26b3779851a2255b95ee650bd928/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
else
   echo "zsh-syntax-highlighting already installed"
fi
if [ ! -d $HOME/.zsh/pure ]; then
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
else
    echo "pure already installed"
fi
