"" global settings

set shell=zsh
set title                       " Show title
set expandtab                   " Use space instead of tab
set textwidth=0
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set commentstring=\ #\ %s
set clipboard+=unnamed          " Share clipboard with other applications
set autoindent
set smartindent                 " 新しい行のインデントを現在行と同じ量にする
set formatoptions=tcqr
set list                                             " Display tab and linefeed
set listchars=tab:^-,trail:_,extends:>,precedes:<    " Characters to display eol, tab, trail and nbsp
set synmaxcol=300
set timeout timeoutlen=1000 ttimeoutlen=50

" Chars
set fileencoding=utf-8                        " Encoding on save
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " Char code detection on read
set fileformats=unix,dos,mac                  " LINE FEED
set ambiwidth=double                          " UTF-8の□や○カーソル位置がずれないようにする

" Search
set nowrapscan                  " ファイルの最後まで検索したら検索をやめる
set incsearch
set ignorecase                  " 検索のときに大文字小文字を区別しない
set smartcase                   " 検索時に大文字が含まれている場合に、大文字と小文字を区別する
set hlsearch                    " Hilight searched chars

" external grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=egrep\ -n

set showmode                    " 現在のモードの表示
set showcmd                     " 入力中のコマンドをステータスに表示する
set matchtime=5                 " 対応する括弧の表示時間を5にする
set notitle
set autoread                    " 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set number
set smarttab
set ruler
set noerrorbells
set mouse=a                     " ターミナルでマウスを使えるようにする
set virtualedit=block           " Enable to move a cursor where there is no charcter in the visual mode.

" Completion
set wildmenu                    " コマンドライン補完を拡張モードにする
set wildchar=<tab>              " コマンド補完を開始するキー
set wildmode=list:longest,full          " リスト表示，最長マッチ
set history=1000                " コマンド・検索パターンの履歴数
set complete+=k                 " 補完に辞書ファイル追加

set guioptions-=a               " Don't allow to send selected text to the clipboard automatically in visual mode
set hidden                      " バッファを保存しなくても他のバッファを表示できるようにする
set confirm                     " バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set visualbell t_vb=            " ビープの代わりにビジュアルベル（画面フラッシュ）を使う。そしてビジュアルベルも無効化する
set cmdheight=3                 " コマンドラインの高さを2行に
set termguicolors

" Backup and swap file settings
set noswapfile
set nobackup
set directory=/tmp,.                 " スワップファイル用ディレクトリ (',.' means trying the current directory next to /tmp)
set backupskip=/tmp/*,/private/tmp/* " don't make backup file in order to avoid error 'crontab: temp file must be edited in place'
set undodir=~/vim/undo

" autowrite
set autowriteall
set updatetime=500

function! s:AutoWriteIfPossible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction

autocmd CursorHold * call s:AutoWriteIfPossible()

filetype plugin indent on
syntax enable

" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/ruby-matchit'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'vim-jp/vimdoc-ja'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'tomasr/molokai'
Plug 'justinmk/vim-sneak'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()



" Key map settings
let g:mapleader = "\<Space>"

" Move across buffers
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-q><C-q> :bd<CR>
nnoremap <C-q><C-f> :bp\|bd #<CR>

" Move across windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Toggle the paste setting
nnoremap <F3> :set paste!<Bar>set paste?<CR>

" delete char at insert
inoremap <C-d> <Del>

" Edit Vimrc
nnoremap <Leader>.v :<C-u>edit $MYVIMRC<CR>
nnoremap <Leader>, :<C-u>source $MYVIMRC<CR>


"" Plugin configurations

" Easymotion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-t2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" fzf.vim
nnoremap <Leader>o :GFiles<CR>
nnoremap <Leader>O :Files<CR>

" Color
colorscheme badwolf " default color scheme
highlight Normal guibg=NONE ctermbg=NONE
