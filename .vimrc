filetype off                  " required
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
    set rtp+=~/.config/nvim/bundle/Vundle.vim
else
    let s:editor_root=expand("~/.vim")
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#rc(s:editor_root . '/bundle')
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'chriskempson/base16-vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tomasiser/vim-code-dark'
Plugin 'Yggdroot/indentLine'
Plugin 'unblevable/quick-scope'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plugin 'hdima/python-syntax'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'takac/vim-hardtime'
Plugin 'SirVer/ultisnips'
Plugin 'dkprice/vim-easygrep'
Plugin 'wellle/targets.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'mg979/vim-visual-multi'
Plugin 'mileszs/ack.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'mindriot101/vim-yapf'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/vim-peekaboo'
Plugin 'reedes/vim-colors-pencil'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'chrisbra/NrrwRgn'
" Plugin 'chaoren/vim-wordmotion'
Plugin 'dominikduda/vim_current_word'
" Plugin 'yuttie/comfortable-motion.vim'
" Plugin 'ervandew/supertab'
" Plugin 'davidhalter/jedi-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'narajaon/onestatus'
" Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'liuchengxu/vim-which-key'
Plugin 'itchyny/lightline.vim'
Plugin 'mhinz/vim-startify'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'TaDaa/vimade'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'voldikss/vim-floaterm'
Plugin 'neoclide/coc.nvim'
Plugin 'luochen1990/rainbow'

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
"
" color dracula
" colorscheme pencil
set bg=dark
colorscheme PaperColor
" colorscheme gruvbox
set cursorline
set showcmd
set nu
set tabstop=4
set shiftwidth=4
" set bg=dark
set hlsearch
set encoding=utf-8
" let g:airline_theme='raven'
" let g:airline_theme='papercolor'
let g:lightline = { 'colorscheme': 'PaperColor'  }
set laststatus=2
" let g:airline_theme='gruvbox'
" let g:airline_powerline_fonts=1
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_alt_sep = '⮃'
" let g:Powerline_symbols='fancy'
" let Powerline_symbols='fancy'
let g:qs_highlight_on_keys=['f', 'F']
" let g:ycm_global_ycm_extra_conf='/Users/lishihong/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf='/Users/lishihong/.config/nvim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_python_binary_path='/Users/lishihong/.pyenv/shims/python'
" let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:hardtime_default_on=1

" my custom settings
let mapleader=","
let g:EasyMotion_do_mapping = 0 " Disable default mappings

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)

" ctrlp setting
" let g:AutoPairsShortcutFastWrap=1

" indent setting
let g:indentLine_setColors = 0

" snip setting
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<C-j>"
autocmd FileType python UltiSnipsAddFiletypes django

" YCM go to define
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_use_ultisnips_completer=1


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

" which key config
nnoremap <silent> <leader> :WhichKey ','<CR>

" maybe i will remove in the future
" move between buffers
" map Oc <C-Right>
" map Od <C-Left>
"
" map <C-Left> <ESC>:bprev<CR>
" map <C-Right> <ESC>:bnext<CR>

" format json
nnoremap <leader>fj :%!python -m json.tool<CR>
inoremap <leader>fj <Esc>:%!python -m json.tool<CR>

" search and replace the word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" search by visual select
vnoremap // y/<C-R>"<CR>

" insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" mac system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

" macro over visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

" cnoreabbrev ag Gcd <bar> Ack!
" let ack can find all from git root
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -nargs=1 Ag execute "Ack! <args> " . Find_git_root()

" exclude quickfix in buffer list
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" coc config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
