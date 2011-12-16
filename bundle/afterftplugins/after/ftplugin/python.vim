setlocal indentkeys-=:,<:>

" enfore line length fascism
set textwidth=80
if exists("&colorcolumn")                                                      
    set colorcolumn=+1                                                         
    hi ColorColumn ctermbg=black ctermfg=red                                   
endif 
