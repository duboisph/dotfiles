" === PLUGINS

" Download vim-plug if not installed
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Define plugins
" Run :PlugInstall to install them
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'               " Shows git diff in the gutter
Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy file finder
Plug 'joshdick/onedark.vim'                 " One Dark color scheme
Plug 'rodjek/vim-puppet'                    " Puppet language support
Plug 'tpope/vim-sensible'                   " Sensible defaults for Vim
Plug 'vim-airline/vim-airline'              " Cool statusline
Plug 'vim-airline/vim-airline-themes'       " Themes for airline
Plug 'vim-syntastic/syntastic'              " Syntax checking
call plug#end()


" === THEMING

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme onedark
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:enable_bold_font=1


" === SETTINGS
" Note: Some defaults are already set by `tpope/vim-sensible`

set clipboard=unnamed                       " Use the OS clipboard
set colorcolumn=80                          " Mark the 80th column
set cursorline                              " Highlight current line
set gdefault                                " Add the g flag to search/replace by default
set hlsearch                                " Highlight searches
set ignorecase                              " Ignore case of searches
set list                                    " Show invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Set invisible characters
set modeline                                " Respect modeline in files
set mouse=a                                 " Enable mouse in all modes
set nocompatible                            " Make Vim more useful
set nostartofline                           " Don’t reset cursor to start of line when moving around.
set number                                  " Enable line numbers
set relativenumber                          " Use relative line numbers
set showcmd                                 " Show the (partial) command as it’s being typed
set tabstop=2                               " Make tabs as wide as two spaces
set visualbell                              " No sounds


" === KEYBINDS

let mapleader=","                                 " Change mapleader
nnoremap <F2> :set invpaste paste?<CR>            " Bind F2 to pastemode (no auto-indentation)
set pastetoggle=<F2>
nnoremap <F3> :set nolist!<CR>                    " Bind F3 to hide/unhide special characters
noremap <leader>W :w !sudo tee % > /dev/null<CR>  " Save a file as root (,W)
