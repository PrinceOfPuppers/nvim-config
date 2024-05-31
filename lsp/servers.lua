local nvim_lsp = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true--[[, silent=true--]] }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<C-L>', '<cmd>:TSHighlightCapturesUnderCursor<CR>', opts) -- requires playground
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
local servers = { 
    'tsserver', -- $ npm i -g typescript typescript-language-server
    'bashls',   -- $ npm i -g bash-language-server
    'csharp_ls', 
    -- 'arduino-language-server', -- delat with below
    -- 'pyright', -- pyright is dealt with below
    'ccls', -- package manager ccls
            -- $ pip install scan-build
            -- $ intercept-build [MAKEFile COMMAND HERE] (do this in project dir to create compile_commands.json)
    'veridian', -- binaries from here: https://github.com/vivekmalneedi/veridian and here: https://github.com/chipsalliance/verible, added to path
    'openscad_ls', -- cargo install openscad-language-server
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      --debounce_text_changes = 150,
    }
  }
end

-- special treatment for arduino
-- local MY_FQBN = "HoodLoader2:avr:HoodLoader2atmega16u2"
local MY_FQBN = "esp8266:esp8266:nodemcuv2"
nvim_lsp.arduino_language_server.setup {
    on_attach = on_attach,
    cmd = {
        "arduino-language-server",
        "-cli", "/usr/bin/arduino-cli",
        "-cli-config", "/home/princeofpuppers/.arduino15/arduino-cli.yaml",
        --"-cli-daemon-addr", "localhost:50051",
        --"-cli-daemon-instance", "1",
        "-clangd", "clangd",
        "-fqbn",
        MY_FQBN
    }
}

-- special treatment for solargraph (ruby)
nvim_lsp.solargraph.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- special treatment for pyright (python)
-- npm i -g pyright
nvim_lsp.pyright.setup {
  flags = {
    --debounce_text_changes = 150,
  },
  on_attach = on_attach,
  settings = {
    python =  {
      analysis = {
        --autoSearchPaths = false,
        --useLibraryCodeForTypes = false,
        diagnosticMode = 'openFilesOnly',
      }
    }
  }
}
