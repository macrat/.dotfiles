#!/bin/bash

cd $(dirname $0)

OPTS="-Tis"
if [[ $(uname) = 'Darwin' ]]; then
    OPTS="-his"
fi

ln $OPTS $PWD/zshrc ~/.zshrc
ln $OPTS $PWD/zshenv ~/.zshenv

ln $OPTS $PWD/gitconfig ~/.gitconfig
ln $OPTS $PWD/gitignore ~/.gitignore

ln $OPTS $PWD/nvim ~/.config/nvim

ln $OPTS $PWD/tmux.conf ~/.tmux.conf

if [[ $(uname) = 'Linux' ]]; then
    ln $OPTS $PWD/Xdefaults ~/.Xdefaults
fi

mkdir -p ~/.config/wezterm
ln $OPTS $PWD/wezterm.lua ~/.config/wezterm/wezterm.lua


cd $PWD/nvim/pack/common/start/markdown-preview.nvim
npm install
