" use vim settings over vi
set nocompatible

" VUNDLE CONFIG
" ---------------------------------
" vundle, required
filetype off

" set the runtime path to include vundle and initialize, required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS
" ---------------------------------
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'lunaru/vim-less'

" end vundle, required
call vundle#end()            
filetype plugin on    

" GENERAL CONFIG
" ---------------------------------
" synax highlighting
syntax on

" colorscheme
colorscheme hemisu
set background=light

" when using > or <, for indent / outdent, go this many spaces
set shiftwidth=4

" display line numbers
set number

" display column number
set ruler

" tab is never \t, but always tabstop number of spaces
set expandtab

" tab is 4 spaces
set tabstop=4

" allow me to change buffers without saving
set hidden

" do not create backup files
set nobackup

" do not create swap files
set noswapfile

" case insensitive matching
set ignorecase

" allow copy/pasting to system clipboard
set clipboard=unnamed

" turn on auto indenting
set autoindent

" flag if leader key is active
set showcmd

" open splits to right/bottom
set splitbelow
set splitright

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Always use vertical diffs
set diffopt+=vertical

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" tab completion
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
