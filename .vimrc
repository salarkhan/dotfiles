" use vim settings over vi
set nocompatible

" synax highlighting
syntax on

" when using > or <, for indent / outdent, go this many spaces
set shiftwidth=2

" display line numbers
set number

" display column number
set ruler

" tab is never \t, but always tabstop number of spaces
set expandtab

" tab is 2 spaces
set tabstop=2

" allow me to change buffers without saving
set hidden

" do not create backup files
set nobackup

" do not create swap files
set noswapfile

" case insensitive matching
set ignorecase

" strip all whitespace on save
autocmd BufWritePre *.* :%s/\s\+$//e

" MAPPINGS
" ===================

" swap ; and :
nnoremap ; :
nnoremap : ;


" FUNCTIONS
" ==================

function! SmartTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SmartTab()<cr>


