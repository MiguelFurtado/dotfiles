set tabstop=4 shiftwidth=4 expandtab nowrap number spell

set mouse=a

syntax on
filetype plugin indent on

"colorscheme base16-onedark
"colorscheme base16-gruvbox-dark-medium
"colorscheme molokai
"colorscheme base16-atelier-dune-light
colorscheme gruvbox

"hide status line
set laststatus=0

" fix base16 weird colors
set termguicolors
set encoding=UTF-8

" highlight the current line
set cul

let mapleader = ","


let base16colorspace=256

" Remove trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" auto-insert closing pairs
"inoremap " ""<left>
"inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


call plug#begin('~/.vim/plugged')

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" When a file is opened, this will switch the vim workspace to the project's
" root
Plug 'airblade/vim-rooter'

" git support
Plug 'airblade/vim-gitgutter'

" highlights yanked region
Plug 'machakann/vim-highlightedyank'

"Plug 'cloudhead/neovim-fuzzy'

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }


call plug#end()

nnoremap <leader>K     <cmd>call CocActionAsync('doHover')<CR>
nnoremap <leader>D     <cmd>call CocAction('jumpDeclaration')<CR>
nnoremap <leader>I     <cmd>call CocAction('jumpImplementation')<CR>
nnoremap <leader>r     <cmd>call CocAction('jumpReferences')<CR>
nnoremap <leader>R     <cmd>call CocAction('refactor')<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>


" NERDTree
"nnoremap <C-k><C-b> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

nnoremap <leader>xx <cmd>TroubleToggle<cr>


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


