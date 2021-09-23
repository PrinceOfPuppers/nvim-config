nnoremap <leader>t  :FloatermToggle<Enter>
hi FloatermBorder guibg=background guifg=normal

autocmd FileType floaterm tnoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
