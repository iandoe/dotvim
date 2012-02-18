" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set softtabstop=2
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=indent,eol,start " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set smartindent     " Do smart autoindenting when starting a new line. Works
                    " for C-like programs, but can also be used for other
                    " languages.
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

set cursorcolumn

set wildmenu
set wildmode=list:longest,full

" Status line
au InsertEnter * hi StatusLine guibg=#ff9800 guifg=#000000
au InsertLeave * hi StatusLine  guifg=#d3d3d5 guibg=#444444
set statusline=%<%f\ %y%h%m%r\ PWD:%{getcwd()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

"set foldmethod=indent " Set the fold method to automatic using the files indenting

" Pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Set Misc stuff
" Always show tab
set showtabline=2
set nocompatible
set noexpandtab
" No backup or swap file
set nobackup
set nowritebackup
set noswapfile

" Set list to show invisible chars
set list
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


" Set delimitMate Options
let delimitMate_expand_cr          = 1
let delimitMate_expand_space       = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_matchpairs         = '(:),[:],{:},<:>'
let delimitMate_quotes             = "\" ' ` |"

" Set Keymappings

" Map <Leader> to , 
let g:mapleader = ","

" Map <Leader>nt to toggle NERDtree
nmap <Leader>nt :NERDTreeToggle<CR> 

" Map ,hl to turnoff search highlight
set nohlsearch
nmap <Leader>hl :nohlsearch<CR>

" Align keymaps (Ruby specific for now)
" Route Align
vmap <Leader>ra :Align :to => 'W'<CR>

" Visual text bubbling using unimpaired plugin
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-Left> <gv
vmap <C-Right> >gv
" Maps arrow keys in visual mode to select by word (faster)
vmap <Left> b
vmap <Right> e
" Closetag plugin
:au Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim
" Less CSS filetype syntax
syntax on
:au BufNewFile,BufRead *.less set filetype=less
" Supertab

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType less set omnifunc=csscomplete#CompleteCSS


" Set various GUI and Appearance Behaviour
set guifont=Anonymous:h14 " Set the Font
set guioptions=aAce " Set the Gui options
colors mustang " Set the colorscheme
filetype plugin indent on
syntax on
