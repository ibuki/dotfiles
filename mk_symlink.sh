#!/bin/bash -eux

cd ${HOME}

# set up directories
mkdir .config
mkdir .config/nvim
mkdir .config/fish

# create symlink

ln -sfvn $HOME/dotfiles/agignore .agignore
ln -sfvn $HOME/dotfiles/gitconfig .gitconfig
ln -sfvn $HOME/dotfiles/gitignore_global .gitignore_global
ln -sfvn $HOME/dotfiles/pryrc .pryrc
ln -sfvn $HOME/dotfiles/tmux.conf .tmux.conf
ln -sfvn $HOME/dotfiles/tmuxinator .tmuxinator
ln -sfvn $HOME/dotfiles/zshenv .zshenv
ln -sfvn $HOME/dotfiles/zshrc .zshrc
ln -sfvn $HOME/dotfiles/config/nvim/init.vim .config/nvim/init.vim
ln -sfvn $HOME/dotfiles/config/fish/config.fish .config/fish/config.fish
ln -sfvn $HOME/dotfiles/config/fish/fishfile .config/fish/fishfile
