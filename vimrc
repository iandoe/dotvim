" Pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

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
set relativenumber
" 3 lines above and below cursor when scrolling
set scrolloff=3

" Set line wrap
set wrap
set textwidth=79
set formatoptions=qrn1

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
set hlsearch
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
set cursorcolumn
" Set menu behaviour
set wildmenu
set wildmode=list:longest,full
" Status line
set laststatus=2

" Set Misc stuff
" Always show tabs
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

let g:yankring_replace_n_pkey = '<c-z>'
let g:yankring_replace_n_nkey = '<m-n>'
" Set delimitMate Options
let delimitMate_expand_cr          = 1
let delimitMate_expand_space       = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_matchpairs         = '(:),[:],{:}'
let delimitMate_quotes             = "\" ' ` |"
" NERDtree
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

" Less CSS filetype syntax
:au BufNewFile,BufRead *.less set filetype=less

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s\+$//e
:endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Set various GUI and Appearance Behaviour
set guifont=Anonymous:h14 " Set the Font
set guioptions=aAce " Set the Gui options
colors mustang " Set the colorscheme
syntax on

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
