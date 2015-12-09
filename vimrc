set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
  Plug 'bling/vim-airline'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'tpope/vim-fugitive'
  Plug 'kien/ctrlp.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-eunuch'
call plug#end()

" General {

  " nomap
  :map <DOWN> <Esc>
  :map <UP> <Esc>
  :map <LEFT> <Esc>
  :map <RIGHT> <Esc>

    filetype plugin indent on
    syntax on
    set mouse=a
    set mousehide
    scriptencoding utf-8
    set fileencoding=utf-8
    set nocompatible
    inoremap jj <ESC> " Left insert mode
    set history=1000
    set virtualedit=onemore         " Allow cursor beyond last character

    set colorcolumn=90

    " Last position in the buffer is the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Setting dirctories {
        set backup
        if has('persistent_undo')
            set undofile
            set undolevels=1000     " Maximum number of changes that can be undone
            set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
        endif
    " }
" }

" Vim Interface {

    colorscheme Tomorrow-Night          " Load a colorscheme
    let g:airline_powerline_fonts = 1
    let g:netrw_liststyle=3

    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'

    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_auto_colors=0

    hi IndentGuidesEven ctermbg=238
    hi IndentGuidesOdd ctermbg=236

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display current mode

    "set cursorline

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        set statusline+=%{fugitive#statusline()}
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formating {
    set nowrap
    set autoindent
    set shiftwidth=2                " Indent is 4 spaces
    set expandtab                   " Tabs are spaces
    set tabstop=2
    set softtabstop=2               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    autocmd BufNewFile,BufRead *.html.erb set filetype=html.erb
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2

" }

" Key Mapping {

    "change buffer with Ctrl+HJKL
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    imap <C-D> <esc> ddi            " Delete line
    imap <C-Y> <esc> yypi           " Duplicate line

    " Keypad {
        :inoremap <Esc>Oq 1
        :inoremap <Esc>Or 2
        :inoremap <Esc>Os 3
        :inoremap <Esc>Ot 4
        :inoremap <Esc>Ou 5
        :inoremap <Esc>Ov 6
        :inoremap <Esc>Ow 7
        :inoremap <Esc>Ox 8
        :inoremap <Esc>Oy 9
        :inoremap <Esc>Op 0
        :inoremap <Esc>On .
        :inoremap <Esc>OQ /
        :inoremap <Esc>OR *
        :inoremap <Esc>Ol +
        :inoremap <Esc>OS -
        :inoremap <Esc>OM <Enter>
   " }

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
" }
