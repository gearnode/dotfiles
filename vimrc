set nocompatible
filetype off
filetype plugin indent on
scriptencoding utf-8

source ~/dotfiles/vimrc.d/plugin.vim
source ~/dotfiles/vimrc.d/alias.vim
source ~/dotfiles/vimrc.d/me.vim

" General
set mouse=a
set fileencoding=utf-8
set history=100
set hidden
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current
set hlsearch " Highlight search terms
set incsearch " Find as you type search
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set scrolloff=3 " Minimum lines to keep above and below cursor
set scrolljump=5 " Lines to scroll when cursor leaves screen
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
autocmd BufWritePre * :%s/\s\+$//e

" Last position in the buffer is the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set backup
if has('persistent_undo')
    set undofile
    set undolevels=1000     " Maximum number of changes that can be undone
    set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
endif

set wildmode=list:longest,list:full
set complete=.,w,t

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
     else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
