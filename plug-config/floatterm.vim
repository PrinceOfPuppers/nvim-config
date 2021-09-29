
nnoremap <leader>t  :FloatermToggle term<Enter>
nnoremap <leader>T  :FloatermToggle bigTerm<Enter>
autocmd FileType floaterm tnoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
autocmd FileType floaterm tnoremap <buffer> <C-n> <C-\><C-n>

function! StartFloatermSilently() abort
  FloatermNew --name=term --title=term --silent
  FloatermNew --name=bigTerm --title=bigTerm --width=0.9 --height=0.9 --silent
endfunction
autocmd VimEnter * call StartFloatermSilently()
