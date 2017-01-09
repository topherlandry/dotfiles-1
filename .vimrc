execute pathogen#infect()
syntax on
filetype plugin indent on

" Solarized
set background=dark
"colorscheme solarized

" swap files to a common spot
set dir=~/.vim/_swap//

" backups to a common spot
set backup
set backupdir=~/.vim/_backup/


" wildmenu
set wildmenu


" STOP BEEPING, FUCK
set vb t_vb=

set incsearch
set ignorecase
set smartcase
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set number

" nerdtree is a useless turd
nmap \e :NERDTreeToggle

" cancel search buffer 
nmap \q :nohlsearch

" line numbers shortcut
nmap \l :setlocal number!


" timeout
autocmd InsertEnter * set timeoutlen=50
autocmd InsertLeave * set timeoutlen=750

" exit insert with jk/kj
inoremap jk <esc>
inoremap kj <esc>

" :W works too
nnoremap :W<cr> :w<cr>

" we don't need no stinkin' arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
