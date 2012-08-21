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
"set number
" Set linenumber to relative
set relativenumber
set formatoptions=cqrn1t
set formatoptions-=o "dont continue comments when pushing o/O
"vertical/horizontal scroll off settings
" 3 lines above and below cursor when scrolling
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

" Use sane regexes. {{{{
nnoremap / /\v
vnoremap / /\v
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

" Various {{{
" Map <Leader> to ,
let g:mapleader = ","
nnoremap <CR> :nohlsearch<cr>

" Made D behave
nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Select pasted text
nnoremap gp `[v`]
" Mapping for tabnav
nmap <c-left> gT
nmap <c-right> gt
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
" }}}

" Files {{{
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

" Folding {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}

" Numbers {{{

" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

" }}}

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

" Powerline {{{
let g:Powerline_symbols='fancy'
" }}}

" IndentGuides {{{
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
" }}}

" }}}

" Set various GUI and Appearance Behaviour {{{
"set guifont=Anonymous:h14 " Set the Font
set guifont=Consolas:h14
set guioptions=aAce " Set the Gui options
set cul " Highlight current line"
colors solarized " Set the colorscheme
set background=light
" change the default EasyMotion shading to more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

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

" Save manual folds {{{
au BufWinLeave * :silent! mkview
au BufWinEnter * :silent! loadview
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

" HTML, PHP{{{
augroup ft_htmlphp
    au!
    au FileType html,php setlocal ts=4 sts=4 sw=4
augroup END
" }}}

" }}}

