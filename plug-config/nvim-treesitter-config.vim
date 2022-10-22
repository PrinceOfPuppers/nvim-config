lua <<EOF
    require'nvim-treesitter.configs'.setup {
        -- Modules and its options go here
        highlight = { enable = true },
        -- incremental_selection = { enable = true },
        -- textobjects = { enable = true },
    }
EOF

" folding docs: https://neovim.io/doc/user/fold.html
set foldmethod=expr
set nofoldenable
set foldexpr=nvim_treesitter#foldexpr()

" hack for arduino
autocmd BufRead,BufNewFile *.ino set filetype=cpp

" set foldminlines=10
