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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'lunaru/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
Plugin 'hdima/python-syntax'
Plugin 'kien/ctrlp.vim'

" end vundle, required
call vundle#end()
filetype plugin on

" GENERAL CONFIG
" ---------------------------------
" synax highlighting
syntax on

" colorscheme
colorscheme hemiblue
set background=light

" allow me to change buffers without saving
set hidden

" do not create backup files
set nobackup

" do not create swap files
set noswapfile

" allow copy/pasting to system clipboard
set clipboard=unnamed

" exclude files/dirs we don't care about
set wildignore+=*/tmp/*,dist,node_modules

" set leader key
let mapleader="\\"

" flag if leader key is active
set showcmd

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" DISPLAY CONFIG
" ---------------------------------
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

" start scrolling three lines before the horizontal window border
set scrolloff=3

" show the filename in the window titlebar
set title

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" INDENT CONFIG
" ---------------------------------
" when using > or <, for indent / outdent, go this many spaces
set shiftwidth=4

" tab is never \t, but always tabstop number of spaces
set expandtab

" tab is 4 spaces
set tabstop=4

" case insensitive matching
set ignorecase

" turn on auto indenting
set autoindent
filetype indent on

" prevent auto wrapping
set formatoptions=cq

" treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" PLUGIN CONFIG
" ---------------------------------
" syntax highlighting for go methods
let g:go_highlight_methods = 1

" tell ctrlp to ignore version control and node modules
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'node_modules\|git'

" use ag in CtrlP for listing files -- respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

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

" SYNTASTIC
" ---------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['jscs']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" \t to toggle syntastic
noremap <leader>t :SyntasticToggleMode<CR>

" JSCS
" ---------------------------------
function! JscsFix()
    "Save current cursor position"
    let l:winview = winsaveview()
    "Pipe the current buffer (%) through the jscs -x command"
    % ! jscs -x
    "Restore cursor position - this is needed as piping the file"
    "through jscs jumps the cursor to the top"
    call winrestview(l:winview)
endfunction
command JscsFix :call JscsFix()

" \f to run JscsFix
noremap <leader>f :JscsFix<CR>

"Run the JscsFix command just before the buffer is written for *.js files"
" autocmd BufWritePre *.js,*.jsx JscsFix
