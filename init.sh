#!/bin/bash

#create symlinks to dotfiles
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.config/nvim
touch ~/.config
touch ~/.config/nvim
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
