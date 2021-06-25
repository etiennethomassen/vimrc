" vimrc file.
"
"
"
set nocompatible
set encoding=UTF-8

syntax on
filetype plugin indent on

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start

set number  " show line number
set ruler   " current line number

set hlsearch    " highlight search results
set incsearch   " move cursor as you type when searching

" vim-plug
" Install vim-plug if it does not exist
" Install Plugins with :PlugInstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" My plugins

" NERDTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Airline
" Requires fonts for best look. On Ubuntu: sudo apt-get install fonts-powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'

Plug 'easymotion/vim-easymotion'

Plug 'morhetz/gruvbox'

Plug 'vimwiki/vimwiki'

Plug 'tmhedberg/Simpylfold'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'

call plug#end()

"let g:airline_theme='minimalist'
let g:airline_theme='gruvbox'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" buffers
let g:airline#extensions#tabline#enabled = 1

" VimWiki
let g:vimwiki_list = [{'path': '~/Documenten/pCloud Sync/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Map Leader key to space bar
let mapleader = "\<space>"

" NERDTree
map <C-n> : NERDTreeToggle<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Pylint with pylint-django
let g:ale_python_pylint_options = '--load-plugins pylint_django'


" Fast split navigatyion withg <Ctrl> + hjkl
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Esc key
inoremap ii <esc>

" Gruvbox theme
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
set termguicolors
