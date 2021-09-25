" " set side numbers
set nu rnu

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'PrinceOfPuppers/nvcode-color-schemes.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kevinhwang91/rnvimr'
Plug 'Pocco81/AutoSave.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tmsvg/pear-tree'
Plug 'voldikss/vim-floaterm'
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


lua <<EOF
  require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    -- incremental_selection = { enable = true },
    -- textobjects = { enable = true },
  }
EOF

syntax on
colorscheme monokai
set termguicolors

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
