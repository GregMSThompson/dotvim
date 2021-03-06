"
" gvimrc (mainly for MacVim)
" Greg Thompson <greg@greg9.com>
"

" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

"
" Global default options
"

if !exists("syntax_on")
    syntax on
endif

" To make tabs more readable, the label only contains the tail of the file
" name and the buffer modified flag.
set guitablabel=%M%t

" Send print jobs to Preview.app.  This does not delete the temporary ps file
" that is generated by :hardcopy.
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error

" This is so that HIG Cmd and Option movement mappings can be disabled by
" adding the line
"   let macvim_skip_cmd_opt_movement = 1
" to the user .vimrc
"
if !exists("macvim_skip_cmd_opt_movement")
    no   <D-Left>       <Home>
    no!  <D-Left>       <Home>
    no   <M-Left>       <C-Left>
    no!  <M-Left>       <C-Left>

    no   <D-Right>      <End>
    no!  <D-Right>      <End>
    no   <M-Right>      <C-Right>
    no!  <M-Right>      <C-Right>

    no   <D-Up>         <C-Home>
    ino  <D-Up>         <C-Home>
    map  <M-Up>         {
    imap <M-Up>         <C-o>{

    no   <D-Down>       <C-End>
    ino  <D-Down>       <C-End>
    map  <M-Down>       }
    imap <M-Down>       <C-o>}

    imap <M-BS>         <C-w>
    imap <D-BS>         <C-u>
endif " !exists("macvim_skip_cmd_opt_movement")

" This is so that the HIG shift movement related settings can be enabled by
" adding the line
"   let macvim_hig_shift_movement = 1
" to the user .vimrc (not .gvimrc!).
"
if exists("macvim_hig_shift_movement")
    " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
    set selectmode=mouse,key
    set keymodel=startsel,stopsel

    " HIG related shift + special movement key mappings
    nn   <S-D-Left>     <S-Home>
    vn   <S-D-Left>     <S-Home>
    ino  <S-D-Left>     <S-Home>
    nn   <S-M-Left>     <S-C-Left>
    vn   <S-M-Left>     <S-C-Left>
    ino  <S-M-Left>     <S-C-Left>

    nn   <S-D-Right>    <S-End>
    vn   <S-D-Right>    <S-End>
    ino  <S-D-Right>    <S-End>
    nn   <S-M-Right>    <S-C-Right>
    vn   <S-M-Right>    <S-C-Right>
    ino  <S-M-Right>    <S-C-Right>

    nn   <S-D-Up>       <S-C-Home>
    vn   <S-D-Up>       <S-C-Home>
    ino  <S-D-Up>       <S-C-Home>

    nn   <S-D-Down>     <S-C-End>
    vn   <S-D-Down>     <S-C-End>
    ino  <S-D-Down>     <S-C-End>
endif " exists("macvim_hig_shift_movement")

" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save

"
" Local settings for Ben Godfrey
"

colorscheme molokai

set guioptions=egmr " hide toolbar by default
set linespace=1
set showtabline=2
set lines=80
set columns=147

if has("gui_macvim")
    set guifont=Menlo:h11
    set fuoptions=maxvert,maxhorz
endif

"
" Custom menus
"

" Add a Preferences... menu item to the Edit menu.
amenu Edit.-SepPrefs- :
amenu Edit.Preferences.Command\ Line\.\.\. :tabedit ~/.vimrc<CR>
amenu Edit.Preferences.GUI\.\.\. :tabedit ~/.gvimrc<CR>

" add some shortcuts to menus
amenu PopUp.-Sep- :
amenu PopUp.Keyword\ Lookup K
amenu PopUp.Open\ Filename\ Under\ Cursor gf

" open project menu item
amenu 10.326 File.-SepPrefs- :
amenu 10.327 File.Projects :Proj<CR>

"
" Keys
"

" word delete
map <silent> <M-BS> db
imap <silent> <M-BS> <Esc>ldbi
map <silent> <M-Del> dw
imap <silent> <M-Del> <Esc>ldwi

" buffer movement
map <silent> <S-M-Left> :bprev<CR>
map <silent> <S-M-Right> :bnext<CR>
imap <silent> <S-M-Left> <Esc>:bprev<CR>
imap <silent> <S-M-Right> <Esc>:bnext<CR>

if has("gui_macvim")
    " window control
    map <silent> <D-w> <C-w>c

    " hide highlighting
    map <silent> <D-H> :nohl<CR>
    imap <silent> <D-H> <Esc>:nohl<CR>a

    " quickfix window and movement
    map <silent> <S-D-Up> :cprev<CR>
    map <silent> <S-D-Down> :cnext<CR>
    imap <silent> <S-D-Up> <Esc>:cprev<CR>
    imap <silent> <S-D-Down> <Esc>:cnext<CR>
    map <silent> <D-e> :cwindow<CR>
    imap <silent> <D-e> <Esc>:cwindow<CR>
    map <silent> <D-E> :cclose<CR>
    imap <silent> <D-E> <Esc>:cclose<CR>

    " tab movement
    map <silent> <S-D-Left> :tabprevious<CR>
    map <silent> <S-D-Right> :tabnext<CR>
    imap <silent> <S-D-Left> <Esc>:tabprevious<CR>
    imap <silent> <S-D-Right> <Esc>:tabnext<CR>

    " Map HTML start-end tag matching to Cmd-5
    map <silent><D-5> \5
    imap <silent><D-5> <Esc>\5a

    " indent/outdent as TextMate et al
    map <silent> <D-]> >>
    imap <silent> <D-]> <Esc>>>a
    vmap <silent> <D-]> >
    map <silent> <D-[> <Lt><Lt>
    imap <silent> <D-[> <Esc><Lt><Lt>a
    vmap <silent> <D-[> <Lt>

    " <D-Return> in TextMate is o in Vim
    map <silent> <D-Return> o
    imap <silent> <D-Return> <Esc>o

    " <D-P> to open project plugin window
    map <silent> <D-P> :Proj<CR>
    imap <silent> <D-P> <Esc>:Proj<CR>

    " <D-T> to open tag list window
    map <silent> <D-L> :TlistToggle<CR>
    imap <silent> <D-L> <Esc>:TlistToggle<CR>

    " <D-r> to disable line wrapping
    map <silent> <D-r> :setlocal formatoptions=<CR>
    imap <silent> <D-r> <Esc>:setlocal formatoptions=<CR>

    " Vim windows (as oppose to OS X windows)
    map <silent> <D-n> :vsplit<CR>
    imap <silent> <D-n> <Esc>:vsplit<CR>

    " <D-8> to set window width to 80 chars
    map <silent> <D-8> :vertical resize 80<CR>
    imap <silent> <D-8> <Esc>:vertical resize 80<CR>

    " <D-9> to set window width to 94 chars
    map <silent> <D-9> :vertical resize 94<CR>
    imap <silent> <D-9> <Esc>:vertical resize 94<CR>

    " Commentify plugin hooks
    map <silent> <D-c> :TC<CR>j
    imap <silent> <D-c> <Esc>:TC<CR>j

    " Make
    map <silent> <D-m> :make<CR>
    imap <silent> <D-m> <Esc>:make<CR>

    " Fullscreen
    map <silent> <D-CR> :set invfullscreen<CR>
endif

" Update ctags
map <silent> <F3> :!ctags -R --exclude=.svn --exclude=.git --exclude=log *<CR>

"
" Local machine settings
"
if filereadable(expand("$HOME/.gvimrc.local"))
    source $HOME/.gvimrc.local
endif
