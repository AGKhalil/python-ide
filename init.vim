" change leader to something nicer
let mapleader = ";"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/indentpython.vim'
Plug 'morhetz/gruvbox'

call plug#end()

" theme
colorscheme gruvbox

" correct tabs
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" flag whitespace
au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

" highlight current cursor line
set cursorline
:hi CursorLine cterm=NONE term=NONE ctermbg=black guibg=NONE
nnoremap <leader>c :set cursorline!<Enter>

" utf-8 support
set encoding=utf-8

" set line numbering
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" configure linter
let g:airline#extensions#enabled = 1 
let b:ale_linters = ['flake8']
let g:ale_fixers = ['yapf']
" enable deoplete on startup
let g:deoplete#enable_at_startup = 1 

" config jedi vim
"" disable autocomplete since we are using deoplete
let g:jedi#completions_enabled = 0
"" open the fo to function in split not another buffer
let g:jedi#use_splits_not_buffers = "right"


" allow new line upon enter in normal mode
nnoremap <Enter> o<Esc>

" config nerdtree
"" toggle nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>
"" enable hidden files
let NERDTreeShowHidden = 1
"" open on start nvim
augroup nerdtree_open
  autocmd!
  autocmd VimEnter * NERDTree | wincmd p
augroup END
"" close on last nvim file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
