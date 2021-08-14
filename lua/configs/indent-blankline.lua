local g = vim.g
require("indent_blankline").setup {
  char = "▏",
  buftype_exclude = {"terminal", "nofile"},
  filetype_exclude = {
    "help",
    "defx",
    "vimwiki",
    "man",
    "gitmessengerpopup",
    "gitcommit",
    "diagnosticpopup",
    "lspinfo",
    "packer",
    "text",
    "markdown",
    "yaml",
    "dashboard",
    "TelescopePrompt",
    "NvimTree",
    "" -- all buffers without a filetype
  },
  space_char_blankline = " ",
  show_current_context = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  use_treesitter = false,
  context_patterns = {
      "class",
      "function",
      "method",
      "^if",
      "while",
      "for",
      "with",
      "func_literal",
      "block",
      "try",
      "except",
      "argument_list",
      "object",
      "dictionary",
      "element"
  }
}

vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
