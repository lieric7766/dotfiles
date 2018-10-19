filetype off                  " required
set nocompatible              " be iMproved, required

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tomasiser/vim-code-dark'
Plugin 'Yggdroot/indentLine'
Plugin 'unblevable/quick-scope'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
" Plugin 'davidhalter/jedi-vim'

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

" vim 8 plugin
packadd termdebug

" my normal setting
syntax on
color dracula
set cursorline
set nu
set tabstop=4
set shiftwidth=4
set bg=dark
let g:airline_theme='raven'
let g:airline_powerline_fonts=1
let g:qs_highlight_on_keys=['f', 'F']
let g:ycm_global_ycm_extra_conf='/home/lieric7766/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let mapleader=","

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" set dispatch map 
autocmd FileType python let b:dispatch = 'python %'
nnoremap <F5> :Dispatch<CR>
nnoremap <F6> :cclose<CR>
nnoremap <F8> :Focus gcc % -o %< -g<CR>

" if vim 8.1
nnoremap <F2> :Termdebug<CR>

" use zsh
nnoremap <leader>z :term zsh<CR>

" move between buffers
map Oc <C-Right>
map Od <C-Left>

map <C-Left> <ESC>:bprev<CR>
map <C-Right> <ESC>:bnext<CR>

" format json
nnoremap <leader>j :%!python -m json.tool<CR>
inoremap <leader>j <Esc>:%!python -m json.tool<CR>

