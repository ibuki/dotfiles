#!/bin/bash
force=$1

function mk_symlink() {
  local src=$1
  local dist=$2
  if [[ $force == 'force' || ( ! -f $dist && ! -d $dist ) ]]; then
    ln -sfvn $src $dist
  fi
}

cd ${HOME}

mk_symlink dotfiles/agignore .agignore
mk_symlink dotfiles/gitconfig .gitconfig
mk_symlink dotfiles/gitignore_global .gitignore_global
mk_symlink dotfiles/gvimrc .gvimrc
mk_symlink dotfiles/iex.exs .iex.exs
mk_symlink dotfiles/pryrc .pryrc
mk_symlink dotfiles/tmux.conf .tmux.conf
mk_symlink dotfiles/tmuxinator .tmuxinator
mk_symlink dotfiles/vimrc .vimrc
mk_symlink dotfiles/zshenv .zshenv
mk_symlink dotfiles/zshrc .zshrc

mk_symlink dotfiles/dein.toml .dein.toml
mk_symlink dotfiles/deinlazy.toml .deinlazy.toml

mkdir -p ${HOME}/.config/nvim
mk_symlink ${HOME}/.vim ${HOME}/.config/nvim/.vim
mk_symlink ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim

mk_symlink dotfiles/lintrc/rubocop.yml .rubocop.yml
mk_symlink dotfiles/lintrc/eslintrc .eslintrc
mk_symlink dotfiles/lintrc/pug-lintrc .pug-lintrc
mk_symlink dotfiles/lintrc/stylelintrc .stylelintrc
mk_symlink ${HOME}/dotfiles/lintrc/yamllint ${HOME}/.config/yamllint
