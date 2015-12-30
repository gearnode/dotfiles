
colorscheme Tomorrow-Night

set number
set cursorline
set mousehide
set virtualedit=onemore " Allow cursor beyond last character
set colorcolumn=90
set linespace=0 " No extra spaces between rows
set foldenable " Auto fold code
set showmatch " Show matching brackets/parenthesis
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set backspace=indent,eol,start  " Backspace for dummies
" [Plugin] Airline
let g:airline_powerline_fonts = 1
if has("statusline")
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  set statusline+=%{fugitive#statusline()}
endif

" [Plugin] Vim Indent Guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=236

" Formating
set nowrap
set autoindent
set shiftwidth=2
set softtabstop=2 " Let backspace delete indent
set expandtab " Tabs are spaces
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
autocmd BufNewFile,BufRead *.html.erb set filetype=html.erb
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2

