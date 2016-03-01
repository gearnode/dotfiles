" nomap move key
:map <DOWN> <Esc>
:map <UP> <Esc>
:map <LEFT> <Esc>
:map <RIGHT> <Esc>
:imap <DOWN> <Esc>
:imap <UP> <Esc>
:imap <LEFT> <Esc>
:imap <RIGHT> <Esc>

" alias <Esc> with jj
inoremap jj <Esc>

" change buffer with Ctrl+HJKL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","

map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
map <C-p> :r !pbpaste<CR>
