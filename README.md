# 会社の先輩にもらった環境をアップデートしていくやつ

長くて大変ですがやると便利です。途中までやって止めるとエラーがたくさん出るようになるので最後までやりましょう、
macOSでもcentos7でもできました。この手順はmacOS用です。
この手順を書いたあとは試していないのでうまく行かなかったら直してください。

## 流れ

- rbenv
- zsh, zsh用ツールの設定
- 設定ファイルのインストール
- tmux

## 手順


### brew

```
$ brew install neovim cmake boost icu4c rbenv ruby-build python python3 zsh golang direnv the_silver_searcher reattach-to-user-namespace peco ghq yarn tmux lv
```

### rbenv

```
$ export PATH=$HOME/.rbenv/bin:$PATH
$ eval "$(rbenv init -)"
$ rbenv install 2.4.3 # 最新
$ rbenv local 2.4.3
$ gem install bundler neovim rubocop
```


### zsh, zsh用ツールの設定

```
$ export GOPATH=$HOME/.go
$ export PATH=$HOME/.go/bin:$PATH
$ ghq get ryoppy/cool-peco
$ ghq look cool-peco
$ bash ./install.sh
$ sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
$ chsh -s /usr/local/bin/zsh
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
$ gem install tmuxinator
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

## 参考サイト

[rbenvのインストール手順](https://qiita.com/issobero/items/e0443b79da117ed48294)

[pyenvのインストール手順](https://qiita.com/1000ch/items/93841f76ea52551b6a97)

https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
