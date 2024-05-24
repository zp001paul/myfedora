#!/bin/bash
cp ~/.zshrc .
cp ~/.tmux.conf .
cp ~/.vimrc .
rsync -avlP ~/.vim .
rsync -avlP ~/.config/kitty .
rsync -avlP ~/.config/ranger .
rsync -avlp ~/.oh-my-zsh/custom .


mkdir containers
cp /etc/containers/registries.conf ./containers/
