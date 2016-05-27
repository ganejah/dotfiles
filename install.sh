#! /bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
git submodule add https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
