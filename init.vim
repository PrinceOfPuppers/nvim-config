

" " set side numbers
set nu rnu

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin()
Plug 'crusoexia/vim-monokai'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kevinhwang91/rnvimr'
Plug 'Pocco81/AutoSave.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tmsvg/pear-tree'
Plug 'voldikss/vim-floaterm'
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

" " lsp diagnostic colors for text
hi LspDiagnosticsVirtualTextError guifg=#90274a
hi LspDiagnosticsVirtualTextWarning guifg=#848528
hi LspDiagnosticsVirtualTextInformation guifg=#88846F
hi LspDiagnosticsVirtualTextHint guifg=#88846F
" " lsp diagnostic underline
hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline


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
