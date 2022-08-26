-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define DiagnosticSignError text=✖ texthl=DiagnosticError numhl=DiagnosticError')
vim.cmd('sign define DiagnosticSignWarn text= texthl=DiagnosticsWarn numhl=DiagnosticWarn')
vim.cmd('sign define DiagnosticSignInfo text= texthl=DiagnosticInfo numhl=DiagnosticInfo')
vim.cmd('sign define DiagnosticSignHint text= texthl=DiagnosticHint numhl=DiagnosticHint')


-- Create a custom handler for hovering (pressing K on thing)
-- or we can load the custom border we defined in settings.lua
--local hover = vim.lsp.with( vim.lsp.handlers.hover, { border = vim.g.floating_window_border_dark })
local hover = vim.lsp.with( vim.lsp.handlers.hover, { 
  border = 'single'
})
vim.lsp.handlers['textDocument/hover'] = hover

-- Settings that get applied to diagnostics
local publishDiagnostics = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, { 
  -- TODO this doesn't only control underline
  -- also word highlight. Must be a highlight group
  underline = true,
  -- virtual_text = true,
  -- virtual_text = {prefix = " "},
  virtual_text = {prefix = " "},
  signs = true,
})
vim.lsp.handlers['textDocument/publishDiagnostics'] = publishDiagnostics

--
-- custom attach function test
local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end
-- this attach function can be associated with an arbitrary LSP
-- this allows you to assign custom settings on a per lang basis
-- TODO add ansi colors to diagnostics
local python_attach = function(client)
	print(" 🐍 Python LSP started 🐍");

	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end


-- Allow snippets to be used
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--sudo pacman -Syu lua-language-server
require'lspconfig'.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
          enable = false,
      },
    },
  },
})

require'lspconfig'.bashls.setup{ capabilities = capabilities }

--sudo pacman -Syu ccls
require'lspconfig'.ccls.setup{}

--npm i -g vscode-langservers-extracted
require'lspconfig'.cssls.setup{}

-- npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{}

--GO111MODULE=on go get golang.org/x/tools/gopls@latest
require'lspconfig'.gopls.setup{}

--npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup{}

--npm i -g vscode-langservers-extracted
require'lspconfig'.jsonls.setup{}

-- npm -i -g pyright
require'lspconfig'.pyright.setup({
  on_attach = python_attach,
  capabilities = capabilities
})

--npm i -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{}

--paru cmake-language-server
require'lspconfig'.cmake.setup{}

--sudo pacman -Syu rust-analyzer
require'lspconfig'.rust_analyzer.setup{}

--paru marksman-bin
require'lspconfig'.marksman.setup{}

-- Configure lspkind symbols
require('lspkind').init({
    -- enables text annotations
    --with_text = false,
    mode = "symbol_text",

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    preset = 'default',
    -- override preset symbols
    symbol_map = {
      Text = "",
      LuaSnip = "✂️",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
