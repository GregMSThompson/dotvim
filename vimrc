"
" vimrc
" Ben Godfrey <ben@ben2.com>
"

" this could be useful ;-)
set nocompatible

" use bash as shell for now, seems a bit more reliable, esp. with fugitive
set shell=bash

" activate pathogen and filetype plugins and indenting
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" turn on syntax highlighting
syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show matches when autocompleting in command mode
set wildmenu

" show the cursor position all the time
set ruler

" do incremental searching and highlight search results
set incsearch
set hlsearch

" command editing
set showcmd		    " display incomplete commands
set cmdwinheight=20 " big window for command history (q:, q/, q?)

" highlight matching parens etc
set showmatch

" check for mac newlines
set ffs+=mac

" disable line wrapping by default
set nowrap

" backup and autosave
set backupcopy=yes
set autowrite
set autowriteall

" tabs, hard line wrapping, indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set autoindent

" default keyword prog is just Google it
set keywordprg=~/Documents/bin/google.py

" include dictionary files and tags in autocomplete scanning
set complete =.,w,b,u,t,i,k,]

" case insensitive searching
set ignorecase

" encoding settings
set termencoding=macroman
set fileencoding=utf-8
set encoding=utf-8

" HTML generation
let html_use_css="yay"

" Project plugin
let g:proj_flags = "Lmst"
let g:proj_window_width = 32
let g:proj_window_increment = 32

" allow windows to be different sizes - required for Project plug in to stay
" sane
set noequalalways

" Snippets plugin
let g:snip_start_tag = "@"
let g:snip_end_tag = "@"

" read first 10 lines for modelines
set modelines=10

" VimClojure config
let vimclojure#HighlightBuiltins = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "~/.vim/ng"
let vimclojure#SplitPos = "bottom"

" show search results in the centre of the window
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
