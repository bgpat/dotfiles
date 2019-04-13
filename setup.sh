#!/usr/bin/env bash

set -eu

git submodule update --init --recursive

ln -sf ~/src/github.com/bgpat/dotfiles/.env ~/.env
echo 'source ~/.env' >> ~/.bashrc

ln -sf ~/src/github.com/bgpat/dotfiles/.vim ~/.vim
ln -sf ~/src/github.com/bgpat/dotfiles/.vimrc ~/.vimrc

mkdir -p ~/.config
ln -sf ~/src/github.com/bgpat/dotfiles/.config/direnv ~/.config/direnv
