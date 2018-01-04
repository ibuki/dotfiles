if !&compatible
  set nocompatible
endif


" Encoding {{{
set encoding=utf8
scriptencoding utf-8
" }}}


" This seems to make switching insert/normal modes slow.
" Change the cursor shape based on the mode {{{
" if has('nvim')
"   let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" endif
" }}}


augroup MyAutoCmd
  autocmd!
augroup END


" dein {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = '~/.dein.toml'
  let s:lazytoml = '~/.deinlazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazytoml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Install vimproc.vim first if it isn't.
if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif

if dein#check_install()
  call dein#install()
endif
" }}}


" Basic settings {{{
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')

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
set cmdheight=2                 " コマンドラインの高さを2行に

" Backup and swap file settings
set noswapfile
set nobackup
set directory=/tmp,.                 " スワップファイル用ディレクトリ (',.' means trying the current directory next to /tmp)
set backupskip=/tmp/*,/private/tmp/* " don't make backup file in order to avoid error 'crontab: temp file must be edited in place'
set undodir=~/vim/undo

filetype plugin indent on
syntax enable
" }}}


" abbreviations {{{
function! s:my_javascript_abbrevs()
  " Should be fixed
  iab <buffer> debug console.log('debug');<ESC>
  iab <buffer> log console.log();<Left><Left>
  iab <buffer> cmnt ////////////////////<ESC>
endfunction

function! s:my_ruby_abbrevs()
  iab <buffer> pry binding.pry<ESC>
  iab <buffer> bb byebug<ESC>
  iab <buffer> frzn # frozen_string_literal: true<ESC>
  iab <buffer> openpage save_and_open_page<ESC>
  iab <buffer> openscreen save_and_open_screenshot<ESC>
  iab <buffer> savescreen save_screenshot<ESC>
  iab <buffer> cmnt ####################<ESC>
endfunction

function! s:my_elixir_abbrevs()
  iab <buffer> pry IEx.pry<ESC>
  iab <buffer> iex require IEx<ESC>
endfunction

augroup MyAbbrevs
  autocmd!
  autocmd BufNewFile,BufRead *.js call s:my_javascript_abbrevs()
  autocmd BufNewFile,BufRead *.rb,*.slim,*.haml,*.rake call s:my_ruby_abbrevs()
  autocmd BufNewFile,BufRead *.ex,*.exs call s:my_elixir_abbrevs()
augroup END
" }}}


" Key map settings {{{
let g:mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>

" Move across buffers
nnoremap <C-a> 0
nnoremap <C-e> $

" Move across buffers
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-q><C-q> :bd<CR>

" Move across windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
if has('nvim')
  nmap <BS> <C-W>h
endif

" Select to the end of the line with v in visual mode
vnoremap v $h

" Enable to add indents continuously.
vnoremap < <gv
vnoremap > >gv

" Delete highlight on search
nnoremap <silent><ESC><ESC> :nohlsearch<CR>

" Toggle the paste setting
nnoremap <F3> :set paste!<Bar>set paste?<CR>

" When there're multiple candidates with tags, display them.
nnoremap <C-]> g<C-]>

" Format JSON
nnoremap <Leader>j !python -m json.tool<CR>

" neovim terminal
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif
" }}}


" quickfix {{{
"   Adjust the height, which you can specify with :cope <num>, based on the results total.
"   ref: http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
function! s:adjust_window_height(minheight, maxheight)
  exe max([min([line('$'), a:maxheight]), a:minheight]) . 'wincmd _'
endfunction

augroup GrepOpen
  autocmd!
  autocmd QuickFixCmdPost *grep* cw
augroup END
" }}}


" Settings per FileType  {{{
augroup MyPerFileTypeSettings
  autocmd!
  " 自動改行を禁止
  autocmd FileType text setlocal textwidth=0
  autocmd Filetype gitcommit setlocal spell textwidth=72
  autocmd FileType qf call s:adjust_window_height(20, 30)
  " Deal with a predicate method suffixed with ? as a word
  autocmd FileType ruby setlocal iskeyword+=?
  " Add jbuilder syntax highlighting
  autocmd BufNewFile,BufRead *.jbuilder setlocal filetype=ruby
augroup END
" }}}


" Save the last cursor position {{{
" ref: https://github.com/vim/vim/blob/master/runtime/defaults.vim#L102
augroup SaveLastCursorPosition
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}


" Display an em space quad {{{
highlight EmSpaceQuad cterm=underline ctermfg=lightblue guibg=darkgray
augroup DisplayEmSpaceQuad
  autocmd!
  autocmd VimEnter,WinEnter * match EmSpaceQuad /　/
augroup END
" }}}


" Reload files automatically when modified on another terminal {{{
set autoread
augroup VimrcCheckTime
  autocmd!
  autocmd WinEnter * checktime
augroup END
" }}}


" Load skelton files {{{
augroup LoadTemplate
  autocmd!
  autocmd BufNewFile *.rb 0r ~/.vim/template/skelton.rb
  autocmd BufNewFile *.rake 0r ~/.vim/template/skelton.rake
  autocmd BufNewFile *.py 0r ~/.vim/template/skelton.py
  autocmd BufNewFile *.pl 0r ~/.vim/template/skelton.pl
  autocmd BufNewFile *.sh 0r ~/.vim/template/skelton.sh
  autocmd BufNewFile *.elm 0r ~/.vim/template/skelton.elm
  "autocmd BufNewFile *.txt 0r ~/.vim/template/skelton.txt
  autocmd BufNewFile *.txt %substitute#__DATE__#\=strftime('%Y-%m-%d')#ge
augroup END
" }}}


" CopyPath {{{
function! s:copy_path()
  let @* = expand('%:P')
endfunction

function! s:copy_path_with_line()
  let @* = expand('%:P') . ':' . line('.')
endfunction

function! s:copy_full_path()
  let @* = expand('%:p')
endfunction

function! s:copy_file_name()
  let @* = expand('%:t')
endfunction

command! CopyPath         :call s:copy_path()
command! CopyPathWithLine :call s:copy_path_with_line()
command! CopyFullPath     :call s:copy_full_path()
command! CopyFileName     :call s:copy_file_name()

nnoremap <silent>cp  :CopyPath<CR>
nnoremap <silent>cpl :CopyPathWithLine<CR>
nnoremap <silent>cfp :CopyFullPath<CR>
nnoremap <silent>cf  :CopyFileName<CR>
" }}}


" Delete whitespaces {{{
" Delete spaces where there are only spaces at the lines.
nnoremap <Leader>ws :%s/ +$//g<CR>

" Delete trailing whitespaces in visual mode.
function! DelTrailingWhitespacesWithRange() range
  execute (a:firstline) . ',' . a:lastline . 's/ +$//g'
endfunction
vnoremap ws :call DelTrailingWhitespacesWithRange()<CR>
" }}}


" vim-expand-region {{{
"   vim-textobj-user and vim-textobj-line need the following settings to make some functions work.
"   They are written here as ''' is included and it conflicts with
"   the syntax for multi lines text in a toml file.
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :0,
      \ 'ie'  :1,
      \ }
" }}}

" autowrite
set autowriteall
set updatetime=500

function s:AutoWriteIfPossible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction

autocmd CursorHold * call s:AutoWriteIfPossible()
autocmd CursorHoldI * call s:AutoWriteIfPossible()

" Edit Vimrc
nnoremap <silent> <Leader>.v :<c-u>edit $MYVIMRC<cr>
nnoremap <silent> <Leader>.d :<c-u>edit ~/.dein.toml<cr>
nnoremap <silent> <Leader>.l :<c-u>edit ~/.deinlazy.toml<cr>
nnoremap <Leader>, :<c-u>source $MYVIMRC<cr>
