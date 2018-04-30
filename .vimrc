set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomasiser/vim-code-dark'
Plugin 'Yggdroot/indentLine'
Plugin 'unblevable/quick-scope'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
color dracula
"colorscheme codedark
"set guifont=Inconsolata\ for\ Powerline\ 20
"set t_Co=256
set cursorline
set nu
set tabstop=4
set shiftwidth=4
let g:airline_theme='raven'
let g:airline_powerline_fonts=1
let g:qs_highlight_on_keys=['f', 'F']

