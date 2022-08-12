local g = vim.g
local fn = vim.fn

local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

-- g.dashboard_custom_footer = {
--     "   ",
--     "NeoVim Loaded " .. plugins_count .. " plugins ",
-- }

-- disable tab line in dashboard
-- vim.cmd([[
-- autocmd FileType dashboard set showtabline=0 laststatus=0 | autocmd WinLeave <buffer> set showtabline=0
-- ]])
--
--
--


local home = os.getenv('HOME')
local db = require('dashboard')
-- db.preview_command = 'cat | lolcat -F 0.3'
db.preview_command = 'cat | cat'
db.preview_file_path = home .. '/.config/nvim/static/ascii/biohazard.cat'
db.preview_file_height = 16
db.preview_file_width = 40
-- TODO make these actually work
db.custom_center = {
    {icon = '  ',
    desc = 'Recently latest session                  ',
    shortcut = 'SPC s l',
    action ='SessionLoad'},
    {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'DashboardFindHistory',
    shortcut = 'SPC f h'},
    {icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'},
    {icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w'},
    {icon = '  ',
    desc = 'Open Personal dotfiles                  ',
    action = 'Telescope dotfiles path=' .. home ..'/dotfiles/dotfiles',
    shortcut = 'SPC f d'},
  }

db.custom_header = alien
