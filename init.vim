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
Plug 'PrinceOfPuppers/nvim-colorschemes'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'lukas-reineke/cmp-rg'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

Plug 'windwp/nvim-autopairs'
" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'


Plug 'kevinhwang91/rnvimr'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'tmsvg/pear-tree'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-treesitter/playground'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Pocco81/auto-save.nvim'
Plug 'puremourning/vimspector'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
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

