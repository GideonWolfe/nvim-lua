local M = {}

M.config = function()
  local g = vim.g
  local tree_cb = require "nvim-tree.config".nvim_tree_callback

  g.nvim_tree_side = "left"
  g.nvim_tree_width = 30
  g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
  g.nvim_tree_auto_open = 1
  g.nvim_tree_auto_close = 1
  g.nvim_tree_quit_on_open = 0
  g.nvim_tree_follow = 1
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_hide_dotfiles = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_root_folder_modifier = ":t"
  g.nvim_tree_tab_open = 0
  g.nvim_tree_auto_resize = 1

  g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1
  }

  --[[ g.nvim_tree_icons = {
      default = " ",
      symlink = "",
      git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
      },
      folder = {
        default = " ",
        open = " ",
        symlink = " ",
        symlink_open = " ",
        empty = " ",
        empty_open = " ",
        arrow_open = " ",
        arrow_closed = " ",
      }
  } ]]

  g.nvim_tree_bindings = {
    { key = "u",                            cb = tree_cb("dir_up") },
  }
end

return M
