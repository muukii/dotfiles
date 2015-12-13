" vundle
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

Plugin 'Lokaltog/vim-powerline'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'https://github.com/cocopon/iceberg.vim.git'
Plugin 'sophacles/vim-processing'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'plasticboy/vim-markdown'
Plugin 'thinca/vim-quickrun'
Plugin 'superbrothers/vim-quickrun-markdown-gfm'
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'toyamarinyon/vim-swift'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'tomasr/molokai'
Plugin 'fatih/vim-go'

filetype plugin indent on

filetype plugin on
filetype indent on

syntax enable

colorscheme monokai 

set noundofile
set nobackup
set noswapfile
set statusline=2
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set number
set numberwidth=5
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set cursorline
set autoread
set list
set noexpandtab
set nosmartindent
set shiftround
set clipboard+=unnamed
set listchars=eol:¬,tab:▸\ 


" like Emacs
imap <C-k> <ESC>d$i
imap <C-y> <ESC>pi
imap <C-d> <Del>

imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-p>  <Up>
imap <C-n>  <Down>

imap <C-c> <ESC>


let g:ctrlp_map = '<c-p>'

" Syntax
au BufRead,BufNewFile *.md set filetype=markdown

" Geeknotee
let g:GeeknoteFormat="markdown"

let g:molokai_original = 1
let g:rehash256 = 1

let g:quickrun_markdown_gfm_github_api_url = 'https://<your-github-enterprise-hostname>/api/v3'
let g:quickrun_config = {
			\   'markdown': {
			\     'type': 'markdown/gfm',
			\     'outputter': 'browser'
			\   }
			\ }

" Golang
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:go_fmt_autosave = 1
