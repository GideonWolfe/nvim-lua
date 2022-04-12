require('gitsigns').setup {
  signs = {
    add = {hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr'},
    change = {hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr'},
    delete = {hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr'},
    topdelete = {hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr'},
    changedelete = {hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr'}
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
    ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
}
