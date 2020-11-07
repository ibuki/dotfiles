# Dotfiles

dotfiles + 環境セットアップ手順です。
- 過去の経歴
  - 会社の先輩が作っていたものをもらう( jp-ryuji/dotfiles )
    - Railsがメインの人。zsh+tmuxinator+nvimでガッツリ開発していた
  - アップデートしつつ、ほとんどそのまま使う
  - メインのエディタをVSCodeにしたのでしばらくほったらかす
  - だったらシンプルにしてしまおうとして設定を絞る
  - コマンドを書く時に読みやすくしたいのでfishにする

# 概要

長くて大変ですがやると便利です。途中までやって止めるとエラーがたくさん出るようになるので最後までやりましょう。
macOSでもcentos7でもできました。この手順はmacOS用です。
この手順を書いたあとは試していないのでうまく行かなかったら直してください。

# 想定する環境

- macOS Catalina
- 英語キーボード
  - Karabina-Elements
- iTerm2
- Clipy
- BTT
- VSCode
  - vscode-vim
- homebrew
  - python # pyenvしない あまり使っていない
  - python2 # pyenvしない あまり使っていない
  - nodenv
    - yarn
  - rbenv
  - fzf
  - ghq
  - fish
  - neovim # 今はあまり使っていない
  - direnv
  - the_sliver_searcher
  - tmux

# セットアップ手順(古い内容です)

## 流れ

- rbenv
- go
- fish, fish用ツールの設定
- 設定ファイルのインストール
- tmux
- vscodeでsettings syncを実行

## 手順

### brew

```
$ brew install neovim cmake boost icu4c rbenv ruby-build python python3 fish golang direnv the_silver_searcher reattach-to-user-namespace fzf ghq yarn tmux lv
```

### rbenv

```
$ export PATH=$HOME/.rbenv/bin:$PATH
$ eval "$(rbenv init -)"
$ rbenv install 2.7.2 # 最新
$ rbenv local 2.7.2
$ gem install bundler neovim rubocop
```


### go

```
$ export GOPATH=$HOME/.go
$ export PATH=$HOME/.go/bin:$PATH
```

### fish, fish用ツールの設定

```
$ sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
$ chsh -s /usr/local/bin/fish
$ fish
$ curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
```

### 設定ファイルのインストール
既存のdotファイル上書きの危険があるので注意！

```
$ cd
$ git clone https://github.com/ibuki/dotfiles.git
$ cd dotfiles
$ sh mk_symlink.sh
$ git config --global user.name John Doe # 自分の名前に入れ替えて実行
$ git config --global user.email johndoe@example.com # 自分のメールアドレスに入れ替えて実行
```


### tmux
```
$ pip3 install psutil powerline-status
$ git clone https://github.com/powerline/fonts.git
$ sh ./fonts/install.sh
$ rm -rf ./fonts
ウィンドウのフォントを inconsolata for powerline に変更する。
```

### 適用・確認

```
新しいウィンドウでターミナルを起動。なんかかっこいいことを確認
$ tmux
# なんかかっこいいことを確認
$ vi
# なんか色々インストールされることを確認。cpsmがなんたらって書いてあったら失敗してる。頑張って読んで調べて対応すること。
```

### VSCodeの設定

```
https://gist.github.com/ibuki/f0d1132faf102460e4f7625d6381102a
```

## 参考サイト

[rbenvのインストール手順](https://qiita.com/issobero/items/e0443b79da117ed48294)

[pyenvのインストール手順](https://qiita.com/1000ch/items/93841f76ea52551b6a97)

https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
