" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

nmap <leader>r :RnvimrToggle<CR>

let g:rnvimr_action = { '<esc>': 'q' }
