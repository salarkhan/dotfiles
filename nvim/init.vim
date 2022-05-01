set nocompatible

" PLUGIN CONFIG
" ---------------------------------
" set dir for plugins
call plug#begin()

" general purpose
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lsp etc
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'


" colorschemes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" initialize plugin system
call plug#end()

" PLUGIN CONFIG
" ---------------------------------
" lsp config and others
lua require('user.lsp')
lua require('user.cmp')

" (fzf) - files
nnoremap <C-p> :Files<CR>

" (fzf) - buffers
nmap <leader>b :Buffers<CR>

" (vim-agriculture) raw ripgrep cmd you can pass arguments to
nmap <leader>r <Plug>RgRawSearch

" (ripgrep) ? to preview search result
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" GENERAL CONFIG
" ---------------------------------
" syntax highlighting
set syntax=on

" give me accurate colors, thanks neovim
" set termguicolors

" colors
let g:gruvbox_contrast_dark='medium'

let vim_color_path = expand('~/.config/nvim/color.vim')
if filereadable(vim_color_path)
  exec 'source' vim_color_path
endif

" completion config
set completeopt=menu,menuone,noselect

" colorize matched searches
set hlsearch

" allow me to change buffers without saving
set hidden

" do not create backup files
set nobackup
set nowritebackup

" better display for messages
set shortmess=atc
set cmdheight=1

" do not create swap files
set noswapfile

" allow copy/pasting to system clipboard
set clipboard+=unnamedplus

" exclude files/dirs we don't care about
set wildignore+=*/tmp/*,dist,node_modules,*.pyc

" workaround to ensure :E maps to Explore
let g:loaded_logipat=1

" case insensitive matching
set ignorecase

" let me use a mouse if i want to
if has('mouse')
  set mouse=a
endif

" keep 1000 lines of cmd history
set history=1000

" when using > or <, for indent / outdent, go this many spaces
set shiftwidth=2

" tab is never \t, but always tabstop number of spaces
set expandtab

" tab is this many spaces
set tabstop=2

" use shiftwidth instead of tabstop
set smarttab

" always show signcolumns
set signcolumn=yes

" DISPLAY CONFIG
" ---------------------------------
" show the filename in the window titlebar
set title

" display line numbers
set number

" open splits to right/bottom
set splitbelow
set splitright

" start scrolling this many lines before the horizontal window border
set scrolloff=5

" show @@@ in the last line if it is truncated
set display=truncate

" REMAP CONFIG
" ---------------------------------
" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" i hold shift too long sometimes
command! W w

" " ; as :
nnoremap ; :

" delete buffer but preserve the split
nmap ,d :bd<bar>bp<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" remove highlights
nmap <leader>h :nohl<CR>

" swap fold modes
nmap ,f :set foldmethod=syntax<CR>
nmap ,m :set foldmethod=manual<CR>

" HELPERS
" ---------------------------------
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
nnoremap <leader>ws :call StripTrailingWhitespace()

