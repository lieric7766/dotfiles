filetype off                  " required

set nocompatible              " be iMproved, required

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim'
Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
" Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'tomasiser/vim-code-dark'
" Plug 'Yggdroot/indentLine'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plug 'hdima/python-syntax'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'takac/vim-hardtime'
Plug 'SirVer/ultisnips'
Plug 'dkprice/vim-easygrep'
Plug 'wellle/targets.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'mg979/vim-visual-multi'
Plug 'mileszs/ack.vim'
Plug 'kshenoy/vim-signature'
Plug 'mindriot101/vim-yapf'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-peekaboo'
Plug 'reedes/vim-colors-pencil'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'chrisbra/NrrwRgn'
" Plug 'chaoren/vim-wordmotion'
Plug 'dominikduda/vim_current_word'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'ervandew/supertab'
" Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'narajaon/onestatus'
" Plug 'maxbrunsfeld/vim-yankstack'
Plug 'liuchengxu/vim-which-key'
" Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
" Plug 'TaDaa/vimade'
Plug 'ntpeters/vim-better-whitespace'
Plug 'voldikss/vim-floaterm'
" Plug 'neoclide/coc.nvim'
" Plug 'luochen1990/rainbow'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'shaunsingh/moonlight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/spellsitter.nvim'
Plug 'mhartington/oceanic-next'
Plug 'f-person/git-blame.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
" Plug 'romgrk/barbar.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
" Initialize plugin system
call plug#end()

" vim 8 plugin
packadd termdebug

" my normal setting
syntax on
set termguicolors
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-default-dark
"
" color dracula
" colorscheme pencil
let g:material_style = 'oceanic'
" let g:material_italic_keywords = v:true
" let g:material_italic_functions = v:true
let g:material_italic_comments = v:true
" let g:material_italic_variables= v:true
colorscheme material
" colorscheme moonlight
" colorscheme PaperColor
" colorscheme gruvbox
" Theme
" syntax enable
" for vim 7
" set t_Co=256
 set completeopt=menuone,noselect
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
" let g:lightline = { 'colorscheme': 'PaperColor'  }
" let g:lightline = { 'colorscheme': 'material'  }
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

" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

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
" let g:indentLine_setColors = 0
let g:indentLine_char = '|'
let g:indent_blankline_show_current_context = 1
let g:indent_blankline_show_trailing_blankline_indent = 0
let g:indent_blankline_context_patterns = ['class', 'def', 'if', 'if_statement', 'while', 'for', 'with', 'try', 'block']


" snip setting
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<C-j>"
autocmd FileType python UltiSnipsAddFiletypes django

" YCM go to define
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  indent = {
    enable = true
  }
}
EOF

" lualine setting
lua <<EOF
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'material-nvim'
    -- ... your lualine config
  }
}
EOF

" todo comment  settings
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" lua <<EOF
" require('spellsitter').setup()
" EOF

" Example config in VimScript
" lua << EOF
" require("github-theme").setup({
" })
" EOF
" telescope
"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" lsp install
lua <<EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF

" nvim-compe
"
lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/net snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
EOF
" lspkind
lua <<EOF
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
EOF
