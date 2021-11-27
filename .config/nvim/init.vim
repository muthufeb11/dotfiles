"call plug#begin('~/.vim/plugged')
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dense-analysis/ale'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'neovim/nvim-lspconfig'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set title

" Main Coloring Configurations
set background=dark
set termguicolors
syntax on
color dracula
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:python3_host_prog = '/Users/muthu/geek_stuffs/programming/python/learn_fastapi/venv/bin/python'
let g:ale_completion_enabled = 1
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_fixers = {}
let g:ale_fixers.python = ['black', 'isort']
let g:ale_fix_on_save = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
autocmd BufWritePre *.py execute ':Black'
autocmd FileType python,rust,javascript,sh EnableStripWhitespaceOnSave
let mapleader=","
inoremap jj <Esc>
inoremap jk <Esc>
nmap <leader>s :Rg<CR>
nmap <leader>d :Files<CR>
