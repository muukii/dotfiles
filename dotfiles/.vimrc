" vundle
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'toyamarinyon/vim-swift'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'fatih/vim-go'
Plugin 'cfdrake/vim-carthage'
Plugin 'mitsuse/autocomplete-swift'
Plugin 'Shougo/NeoComplete'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'cocopon/iceberg.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'rhysd/vim-crystal'
Plugin 'kamwitsta/nordisk'
Plugin 'dunckr/vim-monokai-soda'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'

filetype plugin indent on

filetype plugin on
filetype indent on

" Syntax
syntax enable
colorscheme molokai 

set laststatus=2
set showtabline=2
set noshowmode

set hidden
set noundofile
set nobackup
set noswapfile
set wrap
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set title
set mouse=a
set number
set numberwidth=5
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set cursorline
set autoread
set shiftround
set clipboard+=unnamed
set wildmode=longest:list,full
set list
set backspace=indent,eol,start
"set listchars=tab:¦\ ,eol:¬,trail:-,nbsp:%,extends:>,precedes:<
set listchars=eol:¬,tab:▸\ 
set fillchars=vert:\ ,fold:\ ,diff:\
set t_Co=256

" like Emacs on InsertMode
imap <C-k> <right><ESC><S-d>a
imap <C-y> <ESC>pi
imap <C-d> <Del>

imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-p>  <Up>
imap <C-n>  <Down>

" like Emacs on CommandMode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" alias ESC
imap <C-c> <ESC>

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ctrl-p
let g:ctrlp_map = '<c-p>'

" Syntax
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile Podfile set filetype=ruby

let g:molokai_original = 1
let g:rehash256 = 1

" vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=236
autocmd VimEnter * :IndentGuidesEnable

" quickrun
let g:quickrun_config = {'*': {'split': ''}}
set splitbelow
let g:quickrun_config['swift'] = {
\ 'command': 'swift',
\ 'exec': '%c %o %s',
\}

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

