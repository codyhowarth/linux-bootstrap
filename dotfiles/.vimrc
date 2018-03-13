set t_Co=256
colorscheme molokai
let g:molokai_original = 1
syntax enable

set tabstop=4 " visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces for auto tabbing
set expandtab " tabs become spaaces (turn this off for makefiles n such)


set number " line numbers on
set cursorline " highlight current line
set colorcolumn=80
filetype indent on " load filetype-specific indent files (requires custom indent files)

set wildmenu " visual autocomplete for commands

set lazyredraw " only redraw when necessary

set showmatch " highlight bracket matches

set incsearch " search as characters are entered
set hlsearch " highlight search matches

" Remap default dirs
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Plugin stuff --------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'moll/vim-node'
Plug 'tpope/vim-sensible'
Plug 'chrisbra/NrrwRgn'
"Plug 'w0rp/ale'
Plug 'valloric/youcompleteme'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'lervag/vimtex'
" Optional
Plug 'honza/vim-snippets'

let g:deoplete#enable_at_startup = 1

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" NerdTree Settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NerdTree toggle
map <C-n> :NERDTreeToggle<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
