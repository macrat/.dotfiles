#!/bin/bash

cd $(dirname $0)

OPTS="-Tis"
if [[ $(uname) = 'Darwin' ]]; then
    OPTS="-his"
fi

ln $OPTS $PWD/zshrc ~/.zshrc
ln $OPTS $PWD/zshenv ~/.zshenv

ln $OPTS $PWD/vim ~/.vim

if [[ $(uname) = 'Linux' ]]; then
    ln $OPTS $PWD/Xdefaults ~/.Xdefaults
fi
