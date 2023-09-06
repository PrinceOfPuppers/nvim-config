" " set side numbers
set nu rnu
set mouse=

" hilight cursor line number with CursorLineNr color
set culopt=number
set cul

" keep left margin with diagnostic tags open
set signcolumn=yes

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'PrinceOfPuppers/nvim-colorschemes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kevinhwang91/rnvimr'
Plug 'Pocco81/auto-save.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tmsvg/pear-tree'
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'
Plug 'ray-x/lsp_signature.nvim'
"Plug 'j-hui/fidget.nvim'
"Plug 'tpope/vim-surround'
call plug#end()

set termguicolors

for f in split(glob('~/.config/nvim/plug-config/*.lua'), '\n')
    exe 'source' f
endfor

for f in split(glob('~/.config/nvim/plug-config/*.vim'), '\n')
	    exe 'source' f
endfor

for f in split(glob('~/.config/nvim/lsp/*.lua'), '\n')
    exe 'source' f
endfor

syntax on
colorscheme monokai

" " color floaterm boarders white 
hi FloatermBorder guibg=background guifg=normal

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

vnoremap  <leader>d  "+d
nnoremap  <leader>d  "+d
nnoremap  <leader>dd  "+dd

nnoremap <SPACE> <Nop>
map <Space> <leader>

inoremap <C-k> <cmd>lua vim.lsp.buf.hover()<CR>

