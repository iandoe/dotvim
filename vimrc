" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on

" Enable matchit
runtime $VIMRUNTIME/macros/matchit.vim

" Set vi compatibility to off
set nocompatible
" Use utf8
set encoding=utf-8
" Turn off modelines
set modelines=0
" Map <Leader> to ,
let g:mapleader = ","

" Set linenumber to relative
" set number
" Set linenumber to relative
set relativenumber
" 3 lines above and below cursor when scrolling
set scrolloff=3

" Set line wrap
set wrap
set textwidth=79
set formatoptions=qrn1
" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
" Use spaces
set expandtab
" Show commands in normal mode
set showcmd
" Save after losing focus
au FocusLost * :wa
"  Highlight search as you type
set showmatch
set incsearch
" applies substitutions globally on lines
set gdefault
" lowercase search will be case-insensitive, uppercase search will be case-sensitive
set ignorecase
set smartcase
" Set backspace behaviour
set backspace=indent,eol,start
" Copy indent from current line when starting a new line
set autoindent
set smartindent

" Deal with long lines
set textwidth=79

set formatoptions=c,q,r,t
set ruler

" Set background to dark
set background=dark

" Enable the use of the mouse.
set mouse=a
" Enable cursor column highlight
"set cursorcolumn
" Set menu behaviour
set wildmenu
set wildmode=list:longest,full
" Always show status line
set laststatus=2

" Set Misc stuff
" Always show tabs (nav)
set showtabline=2
" No backup or swap file
set nobackup
set nowritebackup
set noswapfile
" Undofile
set undofile

" Set list to show invisible chars
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Get rid of arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Mapping for tabnav
nmap <c-left> gT
nmap <c-right> gt

" Use Ctrl-B to navigate the buffers with CtrlP plugin
nmap <c-b> :CtrlPBuffer<cr>


" Map ultisnips to behave like textmate/snipmate snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical" 

let g:yankring_replace_n_pkey = '<c-z>'
let g:yankring_replace_n_nkey = '<m-n>'
" Set delimitMate Options
let delimitMate_expand_cr          = 1
let delimitMate_expand_space       = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_matchpairs         = '(:),[:],{:}'
let delimitMate_quotes             = "\" ' ` |"
" NERDtre
" map <leader>nt to toggle nerdtree
nmap <Leader>nt :NERDTreeToggle<CR>
" map <leader>gu to toggle gundo
nmap <Leader>gu :GundoToggle<CR>
" Set NERDtree display options
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1

" Set Powerline plugin display mode
let g:Powerline_symbols = 'unicode'
" Put Gundo on the right side of the window
let g:gundo_right=1

" Set Keymappings
" Map ,yr to :YRShow (YankRing)
nmap <Leader>yr :YRShow<CR>

" Map ,hl to turnoff search highlight
nmap <Leader>hl :nohlsearch<CR>

" Visual text bubbling using unimpaired plugin
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-Left> <gv
vmap <C-Right> >gv

" Closetag plugin
:au Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim

" LESS/SCSS CSS filetype syntax
:au BufRead,BufNewFile *.scss set filetype=scss
:au BufNewFile,BufRead *.less set filetype=less

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s\+$//e
:endfunction

" Set various GUI and Appearance Behaviour
set guifont=Anonymous:h14 " Set the Font
set guioptions=aAce " Set the Gui options
colors railscasts " Set the colorscheme
