-- Global vim options
local opt = vim.opt

-- If we need to specify (:h <option> for info)
local global = vim.o
local window = vim.wo
local buffer = vim.bo
-- vim commands
local cmd = vim.cmd
-- global vars (let g: stuff)
local g = vim.g

-- style we can assign to windows
g.floating_window_border_dark = {
    {"╭", "FloatBorderDark"},
    {"─", "FloatBorderDark"},
    {"╮", "FloatBorderDark"},
    {"│", "FloatBorderDark"},
    {"╯", "FloatBorderDark"},
    {"─", "FloatBorderDark"},
    {"╰", "FloatBorderDark"},
    {"│", "FloatBorderDark"}
}

-- This should't be necessary
-- I already require the config function in packer
-- which sets this setting...
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_open = 1

-- automatically compile plugins.lua when editing
--cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

-- Packer Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- Allow new buffer to be opened without saving current
opt.hidden = true

--  Automatically reread the file if a change was detected outside of vim
opt.autoread = true

-- Automatically activate spellcheck for these files
vim.cmd[[autocmd FileType text,markdown,tex setlocal spell ]]
-- Limit line lenght when writing prose
vim.cmd[[autocmd FileType text,markdown,tex setlocal textwidth=180 ]]



-- required option for compe autocomplete
vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append('c')

-- Don't autosave
g.auto_save = false

-- don't show mode indicator line
opt.showmode = false

-- Enable swap file and location of file
opt.swapfile = true
opt.dir = '/tmp'

-- Highlight search results
opt.hlsearch = true
opt.incsearch = true

-- Case sensitive search unless uppercase is present
opt.ignorecase = true
opt.smartcase = true

-- Keep context around cursor
opt.scrolloff = 3
opt.sidescrolloff = 5

-- Enable mouse scroll
opt.mouse = 'a'

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Automatically reload a file if a change was detected outside of vim
opt.autoread = true

-- Don't automatically collapse markdown and latex
opt.conceallevel = 0

-- Set clipboard to system
opt.clipboard = 'unnamedplus'

-- Show matching braces/tags
opt.showmatch = true

-- Enable line number of current line
-- looking different
-- TODO enable line number color while disabling bar
opt.cursorline = true

-- Tab settings
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

-- Line wrapping
opt.wrap = true

-- Split windows to the right
opt.splitright = true
 
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl") 

-- Don't show status line on vim terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber laststatus=0 ]]

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end


-- Remember last position in file
vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, {last_pos, 0})
  end
end




-- function to set autogroups easily
-- https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_autocmd.lua
local function augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

-- Define our autocommands
local autocmds = {
    --- Current window has hybrid numbers
    --- All other windows have absolute numbers
    numberToggleConditional = {
        {"BufEnter,FocusGained,InsertLeave", "*", [[if &ft !~# 'dashboard' | set relativenumber | endif]]},
        {"BufLeave,FocusLost,InsertEnter", "*", [[if &ft !~# 'dashboard' | set norelativenumber | endif]]}
    },
}
augroups(autocmds)
