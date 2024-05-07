#!/bin/bash
cp ~/.zshrc .
cp ~/.tmux.conf .
rsync -avlP ~/.vim .
rsync -avlP ~/.config/kitty .
rsync -avlP ~/.config/ranger .
rsync -avlp ~/.oh-my-zsh/custom .
