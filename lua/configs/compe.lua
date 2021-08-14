local compe = require('compe')

compe.setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    --border = "double",
    --border = "single",
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true,
    buffer = {kind = "﬘", true},
    calc = {kind = "🧮",true},
    nvim_lsp = true,
    nvim_lua = true,
    --luasnip = true,
    luasnip = {menu = "﬌", true},
    spell = { kind = "  ", true },
  };
})

local opts = {expr = true, noremap = true, silent = true}
vim.api.nvim_set_keymap('i', '<C-y>', "compe#confirm('<C-y>')", opts)
-- not sure what this does
-- vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
