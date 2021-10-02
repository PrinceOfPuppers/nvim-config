" https://github.com/puremourning/vimspector#human-mode
"
" F3 	        stop debugging
" <leader>F3    close debugger
" F4 	        restart
" F5 	        start/continue
" F6 	        Pause
" F8 	        Add a function breakpoint for the expression under cursor
" <leader>F8 	Run to Cursor
" F9 	        Toggle line breakpoint on the current line.
" <leader>F9 	Toggle conditional line breakpoint or logpoint on the current line.
" F10 	        Step Over
" F11 	        Step Into
" F12 	        Step out of current function scope
"
let g:vimspector_enable_mappings = 'HUMAN'
nmap <silent> <F2> :FloatermNew --title=DebugControls --disposable nvim -R ~/.config/nvim/plug-config/vimspector-config.vim<CR>

nmap <silent> <leader><F3> :call vimspector#Reset()<CR>

