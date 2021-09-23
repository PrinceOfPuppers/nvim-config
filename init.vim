call plug#begin()
Plug 'crusoexia/vim-monokai'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kevinhwang91/rnvimr'
Plug 'Pocco81/AutoSave.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

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
set termguicolors

set nu rnu
