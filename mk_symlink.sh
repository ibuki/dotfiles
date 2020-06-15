#!/bin/bash -eux

cd ${HOME}

# set up directories
mkdir .config
mkdir .config/nvim
mkdir .config/fish
mkdir .config/yamllint

# create symlink

ln -sfvn dotfiles/agignore $HOME/.agignore
ln -sfvn dotfiles/gitconfig $HOME/.gitconfig
ln -sfvn dotfiles/gitignore_global $HOME/.gitignore_global
ln -sfvn dotfiles/pryrc $HOME/.pryrc
ln -sfvn dotfiles/tmux.conf $HOME/.tmux.conf
ln -sfvn dotfiles/tmuxinator $HOME/.tmuxinator
ln -sfvn dotfiles/zshenv $HOME/.zshenv
ln -sfvn dotfiles/zshrc $HOME/.zshrc
ln -sfvn dotfiles/rubocop.yml $HOME/.rubocop.yml
ln -sfvn dotfiles/eslintrc $HOME/.eslintrc
ln -sfvn dotfiles/pug-lintrc $HOME/.pug-lintrc
ln -sfvn dotfiles/stylelintrc $HOME/.stylelintrc
ln -sfvn dotfiles/config/yamllint/config $HOME/.config/yamllint/config
ln -sfvn dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sfvn dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish
