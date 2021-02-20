"scriptencoding utf-8

" === PLUGINS

" Download vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  execute '!curl -s -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Define plugins
" Run :PlugInstall to install them
call plug#begin('~/.config/nvim/plugged')
  Plug 'airblade/vim-gitgutter'                                   " Shows git diff in the gutter
  Plug 'dracula/vim', { 'as': 'dracula' }                         " Dracula color scheme
  Plug 'godlygeek/tabular'                                        " Text alignment
  Plug 'neomake/neomake'                                          " Async linting and make
  Plug 'sheerun/vim-polyglot'                                     " Collection of language packs (Ansible, Puppet, TF, ...)
  Plug 'vim-airline/vim-airline'                                  " Cool statusline
  " Plugins to play nice with tmux
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'roxma/vim-tmux-clipboard'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" === THEMING

" Use 24-bit (true-color) mode in Neovim 0.1.5+, Vim 7.4.1799+
set termguicolors
colorscheme dracula
let g:enable_bold_font=1

" === SETTINGS

" Enable the Python providers
let g:python_host_prog  = '/home/linuxbrew/.linuxbrew/bin/python'
let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'

" Change cursor depending on mode
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Limit syntax highlighting (performance killer)
set synmaxcol=256
syntax sync minlines=256

set clipboard=unnamedplus                   " Use the OS clipboard
set colorcolumn=80                          " Mark the 80th column
set cursorline                              " Highlight current line
set expandtab                               " Use spaces instead of tabs
set fixeol                                  " Add blank line at the end of a file if missing
set gdefault                                " Add the g flag to search/replace by default
set ignorecase                              " Ignore case of searches
set lazyredraw                              " Buffer screen updates
set list                                    " Show invisible characters
set listchars=tab:>\ ,trail:·,eol:¬,nbsp:_  " Set invisible characters
set modeline                                " Respect modeline in files
set nostartofline                           " Don’t reset cursor to start of line when moving around.
set number                                  " Enable line numbers
set relativenumber                          " Use relative line numbers
set shiftwidth=2                            " Make indentation (>) as wide as two spaces
set tabstop=2                               " Make tabs as wide as two spaces

" === PLUGINSETTINGS

" Set Airline (statusline) theme
let g:airline#extensions#tabline#enabled=1

augroup vimrc
  autocmd!

  " Run Neomake on every write
  autocmd BufWritePost * Neomake
augroup END

" === KEYBINDS

let g:mapleader=','                                 " Change mapleader
nnoremap <F2> :set invpaste paste?<CR>            " Bind F2 to pastemode (no auto-indentation)
set pastetoggle=<F2>
nnoremap <F3> :set nolist!<CR>                    " Bind F3 to hide/unhide special characters
noremap <leader>W :w !sudo tee % > /dev/null<CR>  " Save a file as root (,W)
