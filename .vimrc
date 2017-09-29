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
set relativenumber 
set wrap lbr 


" cancel search buffer 
nmap \q :nohlsearch

" line numbers shortcut
nmap \l :setlocal number!


autocmd FileType markdown
     \ setlocal spell wrap |

 
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$


" timeout
autocmd InsertEnter * set timeoutlen=50
autocmd InsertLeave * set timeoutlen=750

" exit insert with jk/kj
inoremap jk <esc>
inoremap kj <esc>

" :W works too
nnoremap :W<cr> :w<cr>


" Split navs
nnoremap <C-J> <C-W><C-J><C-W>_
nnoremap <C-K> <C-W><C-K><C-W>_
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" we don't need no stinkin' arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
