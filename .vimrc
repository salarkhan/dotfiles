" use vim settings over vi
set nocompatible

" PLUGIN CONFIG
" ---------------------------------
" vundle, required
filetype off

" set the runtime path to include vundle and initialize, required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage itself, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'

" end vundle, required
call vundle#end()
filetype plugin on


" GENERAL CONFIG
" ---------------------------------
" syntax highlighting
syntax on

" colorscheme
set background=light

" colorize matched searches
set hlsearch

" allow me to change buffers without saving
set hidden

" do not create backup files
set nobackup

" do not create swap files
set noswapfile

" allow copy/pasting to system clipboard
set clipboard=unnamed

" exclude files/dirs we don't care about
set wildignore+=*/tmp/*,dist,node_modules,*.pyc

" workaround to ensure :E maps to Explore
let g:loaded_logipat = 1

" case insensitive matching
set ignorecase

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" DISPLAY CONFIG
" ---------------------------------
" show the filename in the window titlebar
set title

" display line numbers
set number

" display column number
set ruler

" open splits to right/bottom
set splitbelow
set splitright

" always use vertical diffs
set diffopt+=vertical

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" start scrolling this many lines before the horizontal window border
set scrolloff=3


" INDENT CONFIG
" ---------------------------------
" when using > or <, for indent / outdent, go this many spaces
set shiftwidth=2

" tab is never \t, but always tabstop number of spaces
set expandtab

" tab is this many spaces
set tabstop=2

" turn on auto indenting
set autoindent
filetype indent on

" prevent auto wrapping
set formatoptions=cq

" treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" HELPERS
" ---------------------------------
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

" delete trailing whitespace
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal mz"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
