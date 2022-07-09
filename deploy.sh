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

ln $OPTS $PWD/vim ~/.vim

ln $OPTS $PWD/tmux.conf ~/.tmux.conf

if [[ $(uname) = 'Linux' ]]; then
    ln $OPTS $PWD/Xdefaults ~/.Xdefaults
fi
