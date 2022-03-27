# Dotfiles

dotfiles + 環境セットアップ手順です。
- 過去の経歴
  - 会社の先輩が作っていたものをもらう( jp-ryuji/dotfiles )
    - Railsがメインの人。zsh+tmuxinator+nvimでガッツリ開発していた
  - アップデートしつつ、ほとんどそのまま使う
  - メインのエディタをVSCodeにしたのでしばらくほったらかす
  - だったらシンプルにしてしまおうとして設定を絞る
  - コマンドを書く時に読みやすくしたいのでfishにする
  - fish記法が嫌になったのでzshに戻す
  - M1 Mac買った

# 概要

長くて大変ですがやると便利です。途中までやって止めるとエラーがたくさん出るようになるので最後までやりましょう。
この手順はM1 mac用です。

# 想定する環境

- macOS Monterey
- Google日本語入力 (要Rosetta2)
- 英語キーボード
  - Karabina-Elements
    - Use Command key as kana
- iTerm2
  - 色は [deep](https://iterm2colorschemes.com/
  - 透明度11
  - フォントをInconsolata for powerline 。(あとでHomebrewで入る。)
- Clipy
  - 履歴を100にする
- BTT
  - キーバインドでウィンドウをサイズ調整して端に寄せる設定をする
- VSCode
  - vscode-vim
- homebrew
  - python3 # 使っていない
  - anyenv
    - nodenv
      - yarn
    - rbenv
  - fzf
  - ghq
  - zsh
    - zplug
    - z
    - pure
  - neovim # 今はあまり使っていない
  - direnv
  - ripgrep
  - tmux

# セットアップ手順

## 流れ

- OSの設定
- Homebrewの初期化とGitインストール
- 設定ファイルのインストール
- Homebrewで依存関係インストール
- anyenv
- rbenv
- nodenv
- tmux
- vscodeでsettings syncを実行

## 手順

- まず、このリポジトリを取得して、その中に移動する。

### OSの設定

- 解像度を dot by dot (4K)にする
- Dockを左に表示
- トラックパッド
  - タップでクリック
- キーボード
  - 修飾キー
    - Caps Lockキー -> Control
- アクセシビリティ
  - ポインタコントロール
    - トラックパッドオプション
      - 3本指のドラッグ
- Finder
  - パスバーを表示
  - ステータスバーを表示
- 省エネルギー
  - スリープを30分後
- キーリピート設定
```
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
```
- .DS_Storeをなるべく作らない
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

### Homebrewの初期化とGitインストール

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```


### 設定ファイルのインストール
設定がある環境で実行すると既存のファイルを上書きする危険があるので注意！

```
cd
git clone https://github.com/ibuki/dotfiles.git
cd ~/dotfiles
sh mk_symlink.sh
git config --global user.name John Doe # 自分の名前に入れ替えて実行
git config --global user.email johndoe@example.com # 自分のメールアドレスに入れ替えて実行
```


### Homebrewで依存関係インストール

```
brew bundle --file ~/dotfiles/Brewfile
```

### anyenv
```
eval "$(anyenv init -)"
anyenv install --init
```

### rbenv

```
anyenv install rbenv
rbenv install 3.1.1 # 最新
rbenv global 3.1.1
gem install bundler neovim rubocop
```

### nodenv

```
anyenv install nodenv
nodenv install 16.14.0 # 最新
nodenv global 16.14.0
npm i -g yarn
```


### tmux

```
pip install psutil powerline-status
```

### 適用・確認

```
# 新しいウィンドウでターミナルを起動。なんかかっこいいことを確認
tmux
# なんかかっこいいことを確認
vi
# なんか色々インストールされることを確認。cpsmがなんたらって書いてあったら失敗してる。頑張って読んで調べて対応すること。
# PlugInstallとかCheckHealthしたほうがいいかも
```

### VSCodeの設定 (古い)

```
https://gist.github.com/ibuki/f0d1132faf102460e4f7625d6381102a
```
