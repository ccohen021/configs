set relativenumber
set number
set incsearch
set nowrap
set nowrapscan
let mapleader = " "
let g:airline_theme='onehalfdark'

nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>
nnoremap <leader>u <cmd>source ~/.config/nvim/init.vim<cr>
nnoremap <leader>I <cmd>CocInstall -sync<cr>
" Turn off highlighting (Best used after a search)
nnoremap <leader>/ <cmd>noh<cr>
nnoremap <leader>t :FloatermNew zsh<cr>
nnoremap <leader>l :FloatermNew lf<cr>

call plug#begin('~/.config/nvim/plugged')

" --------------------------COC-----------------------------------
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" ---------------------------------------------------------------

" --------------------------telescope--------------------------

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" -------------------------------------------------------------
" A floating terminal
Plug 'voldikss/vim-floaterm'


" A color code highliter
Plug 'chrisba/Colorizer'

" A parenthesis pair highlighter
Plug 'tpope/vim-surround'

" Airline info footer
Plug 'bling/vim-airline'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Typescript syntax highlighting
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

" JavaScript syntax highlighting
Plug 'yuezk/vim-js'

" Jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }


Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

" ===========================Functions====================================

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" neat features
set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
set cc=80
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast

" inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
" inoremap [ []<Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

" open new split panes to right and below
set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>


" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

colorscheme onehalfdark
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up>  NOOOOOOOOOOO 
inoremap <Down> NOOOOOOOOOOO 
inoremap <Left> NOOOOOOOOOOO 
inoremap <Right> NOOOOOOOOOOO 

" :inoremap <esc> NO ESCAPE FOR YOU

au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
