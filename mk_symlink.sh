#!/bin/bash

cd ${HOME}

ln -s dotfiles/agignore .agignore
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore_global .gitignore_global
ln -s dotfiles/gvimrc .gvimrc
ln -s dotfiles/iex.exs .iex.exs
ln -s dotfiles/pryrc .pryrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/tmuxinator .tmuxinator
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/vimshrc .vimshrc
ln -s dotfiles/zshenv .zshenv
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/zshrc.alias_public .zshrc.alias_public
ln -s dotfiles/vim .vim

ln -s dotfiles/dein.toml .dein.toml
ln -s dotfiles/deinlazy.toml .deinlazy.toml

# neovim
mkdir -p ${HOME}/.config/nvim
ln -snfv ${HOME}/.vim ${HOME}/.config/nvim/
ln -snfv ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
