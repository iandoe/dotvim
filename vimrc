" Set vi compatibility to off and term colors {{{
set nocompatible
set t_Co=256
" }}}

" Pathogen {{{
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on
" }}}

" Runtime {{{
runtime macros/matchit.vim
" }}}

" Base vim conf  {{{
" Use utf8
set encoding=utf-8
set termencoding=utf-8
set hidden
set lz " lazy redraw"
set modelines=0 " no modelines
" Set linenumber to absolute
" set number
" Set linenumber to relative
set relativenumber
" 3 lines above and below cursor when scrolling
set formatoptions=cqrn1t
set formatoptions-=o "dont continue comments when pushing o/O
"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
" Set line wrap
set wrap
set textwidth=79
" Use spaces
set expandtab
" Show commands in normal mode
set showcmd
" Save after losing focus
au FocusLost * :silent! wa
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
" Auto read changed files
set autoread
" Deal with long lines
set textwidth=79
set ruler
" Set background to dark
set background=dark
" Enable the use of the mouse.
set mouse=a
" Set menu behaviour
set wildmenu
set wildmode=list:longest,full
" Always show status line
set laststatus=2
"  Highlight search as you type
set hlsearch
set showmatch
set incsearch
" Tab settings
set ts=2
set sts=2
set sw=2
set smarttab

" }}}

" Set Misc stuff {{{
" Always show tabs (nav)
set showtabline=2
" No backup or swap file
set nobackup
set nowritebackup
set noswapfile
" Undofile
set undodir=~/.vim/undofiles
set undofile
" Ignore undofiles
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\undofiles$\'
  \ }
" Set list to show invisible chars
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" }}}

" Get rid of arrow keys {{{
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
" }}}

" Set Keymappings {{{
" Map <Leader> to ,
let g:mapleader = ","
nnoremap <CR> :nohlsearch<cr>
" Mapping for tabnav
nmap <c-left> gT
nmap <c-right> gt
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
" }}}

" Plugins {{{
" CtrlP {{{
" Use Ctrl-B to navigate the buffers with CtrlP plugin
let g:ctrlp_clear_cache_on_exit = 0
nmap <c-b> :CtrlPBuffer<cr>
" }}}

" Ultisnips Settings {{{
let g:UltiSnipsSnippetDirectories=["snippets"]
" Map ultisnips to behave like textmate/snipmate snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" Set delimitMate Options {{{
let delimitMate_expand_cr          = 1
let delimitMate_expand_space       = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_matchpairs         = '(:),[:],{:}'
let delimitMate_quotes             = "\" ' ` |"
" }}}

" Neocomplcache settings {{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_select = 1
" }}}

" Closetag plugin {{{
:au Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim
" }}}

" NERDtree {{{
" map <leader>nt to toggle nerdtree
nmap <Leader>t :NERDTreeToggle<CR>
" map <leader>gu to toggle gundo
nmap <Leader>gu :GundoToggle<CR>
" Set NERDtree display options
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
" }}}

" Gundo {{{
let g:gundo_right=1
" }}}

" Visual text bubbling using unimpaired plugin {{{
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-Left> <gv
vmap <C-Right> >gv
" }}}
" }}}

" Set various GUI and Appearance Behaviour {{{
set guifont=Anonymous:h14 " Set the Font
set guioptions=aAce " Set the Gui options
set cul " Highlight current line"
colors Tomorrow-Night-Eighties " Set the colorscheme
" }}}

" Removes trailing spaces on file save {{{
function! TrimWhiteSpace()
    %s/\s\+$//e
:endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
" }}}

" Remember cursor position on file opening {{{
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
"}}}

" Filetype Specific {{{
" CSS, LessCSS and SCSS {{{
augroup ft_css
    au!
    au BufRead,BufNewFile *.scss set filetype=scss
    au BufNewFile,BufRead *.less set filetype=less
    au Filetype less,css,scss setlocal foldmethod=indent
    au Filetype less,css,scss setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css,scss setlocal iskeyword+=-
augroup END
" }}}

" Vim FT {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}
" }}}
