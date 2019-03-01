" use vim settings over vi
set nocompatible

" PLUGIN CONFIG
" ---------------------------------
" set dir for plugins
call plug#begin('~/.vim/plugged')

" plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'zhimsel/vim-stay'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'

" initialize plugin system
call plug#end()

" RIPGREP/FZF CONFIG
" ---------------------------------
" set fzf
set rtp+=/usr/local/opt/fzf

" ? to preview search result
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" preview for :Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" LANGUAGE CONFIG
" ---------------------------------
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1

" GENERAL CONFIG
" ---------------------------------
" syntax highlighting
syntax on

" colorscheme
set t_Co=256
set background=light
colorscheme PaperColor

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

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" let me use a mouse if i want to
if has('mouse')
  set mouse=a
endif

" keep 200 lines of cmd history
set history=1000	

" DISPLAY CONFIG
" ---------------------------------
" show the filename in the window titlebar
set title

" display line numbers
set number

" open splits to right/bottom
set splitbelow
set splitright

" always use vertical diffs
set diffopt+=vertical

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" start scrolling this many lines before the horizontal window border
set scrolloff=5

" show @@@ in the last line if it is truncated
set display=truncate

" remember my folds pls
set foldmethod=syntax
set viewoptions=cursor,folds,slash,unix

" INDENT CONFIG
" ---------------------------------
" when using > or <, for indent / outdent, go this many spaces
set shiftwidth=2

" tab is never \t, but always tabstop number of spaces
set expandtab

" tab is this many spaces
set tabstop=2

" use shiftwidth instead of tabstop 
set smarttab

" HELPERS
" ---------------------------------
" super simple tab completion
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
