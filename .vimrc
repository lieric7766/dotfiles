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
Plugin 'chriskempson/base16-vim'
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
Plugin 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plugin 'hdima/python-syntax'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'takac/vim-hardtime'
Plugin 'SirVer/ultisnips'
Plugin 'dkprice/vim-easygrep'
Plugin 'wellle/targets.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gabesoft/vim-ags'
Plugin 'kshenoy/vim-signature'
Plugin 'mindriot101/vim-yapf'
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
" set termguicolors
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-default-dark
color dracula
set cursorline
set nu
set tabstop=4
set shiftwidth=4
set bg=dark
set hlsearch
set encoding=utf-8
let g:airline_theme='raven'
let g:airline_powerline_fonts=1
" let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:Powerline_symbols='fancy'
let Powerline_symbols='fancy'
let g:qs_highlight_on_keys=['f', 'F']
let g:ycm_global_ycm_extra_conf='/Users/lishihong/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
" let g:hardtime_default_on=1

" my custom settings
let mapleader=","

" YCM go to define
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Nerd Tree toggling
nnoremap <F1> :NERDTreeToggle<CR>

" tag bar open 
nnoremap <F3> :TagbarOpen<CR>

" maybe i will remove in the future
" move lines up and down
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" set dispatch map 
autocmd FileType python let b:dispatch = 'python %'
nnoremap <F5> :Dispatch<CR>
nnoremap <F6> :cclose<CR>
nnoremap <F8> :Focus gcc % -o %< -g<CR>

" if vim 8.1
nnoremap <F2> :Termdebug<CR>

" use zsh
nnoremap <leader>z :term zsh<CR>

" maybe i will remove in the future
" move between buffers
" map Oc <C-Right>
" map Od <C-Left>
" 
" map <C-Left> <ESC>:bprev<CR>
" map <C-Right> <ESC>:bnext<CR>

" format json
nnoremap <leader>j :%!python -m json.tool<CR>
inoremap <leader>j <Esc>:%!python -m json.tool<CR>

" search and replace the word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
