-- vim commands
local cmd = vim.cmd
-- global vars (let g: stuff)
local g = vim.g

-- style we can assign to windows
g.floating_window_border_dark = {
	{ "╭", "FloatBorderDark" },
	{ "─", "FloatBorderDark" },
	{ "╮", "FloatBorderDark" },
	{ "│", "FloatBorderDark" },
	{ "╯", "FloatBorderDark" },
	{ "─", "FloatBorderDark" },
	{ "╰", "FloatBorderDark" },
	{ "│", "FloatBorderDark" },
}
-- Don't autosave
g.auto_save = false

-- automatically compile plugins.lua when editing
--cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

-- Packer Commands
cmd([[command! WhatHighlight :call util#syntax_stack()]])
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

-- Automatically activate spellcheck for these files
vim.cmd([[autocmd FileType text,markdown,tex setlocal spell ]])
-- Limit line lenght when writing prose
vim.cmd([[autocmd FileType text,markdown,tex setlocal textwidth=180 ]])

local settings = {
	-- Allow new buffer to be opened without saving current
	hidden = true,
	--  Automatically reread the file if a change was detected outside of vim
	autoread = true,
	-- required option for compe autocomplete
	completeopt = "menuone,noselect",
	-- don't show mode indicator line
	showmode = false,
	-- Enable swap file and location of file
	swapfile = true,
	dir = "/tmp",
	-- Highlight search results
	hlsearch = true,
	incsearch = true,
	-- Case sensitive search unless uppercase is present
	ignorecase = true,
	smartcase = true,
	-- Keep context around cursor
	scrolloff = 3,
	sidescrolloff = 5,
	-- Enable mouse scroll
	mouse = "a",
	-- Line Numbers
	number = true,
	relativenumber = true,
	-- Don't automatically collapse markdown and latex
	conceallevel = 0,
	-- Set clipboard to system
	clipboard = "unnamedplus",
	-- Show matching braces/tags
	showmatch = true,
	-- Enable line number of current line
	-- looking different
	-- TODO enable line number color while disabling bar
	cursorline = true,
	-- Tab settings
	expandtab = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	smarttab = true,
	autoindent = true,
	smartindent = true,
	shiftround = true,
	-- Line wrapping
	wrap = true,
	-- Split windows to the right
	splitright = true,
	-- make statusline cover the entire bottom
	laststatus = 3,
	-- creates a backup file
	backup = false,
	-- more space in the neovim command line for displaying messages
	cmdheight = 2,
	-- the encoding written to a file
	fileencoding = "utf-8",
	-- pop up menu height
	pumheight = 10,
	-- always show tabs
	showtabline = 2,
	-- force all horizontal splits to go below current window
	splitbelow = true,
	-- time to wait for a mapped sequence to complete (in milliseconds)
	timeoutlen = 500,
	-- enable persistent undo
	undofile = true,
	-- faster completion (4000ms default)
	updatetime = 300,
	-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	writebackup = false,
	-- set number column width to 2 {default 4}
	numberwidth = 2,
	-- always show the sign column, otherwise it would shift the text each time
	signcolumn = "yes",
}

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")

for k, v in pairs(settings) do
	vim.opt[k] = v
end

-- Don't show status line on vim terminals
vim.cmd([[ au TermOpen term://* setlocal nonumber laststatus=0 ]])

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
	"gzip",
	"man",
	"matchit",
	"matchparen",
	"shada_plugin",
	"tarPlugin",
	"tar",
	"zipPlugin",
	"zip",
	"netrwPlugin",
}

for i = 1, 10 do
	g["loaded_" .. disabled_built_ins[i]] = 1
end

-- Remember last position in file
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		vim.cmd([[
      if line("'\"") > 0 && line("'\"") <= line("$") |
        exe "normal! g`\"" |
      endif
    ]])
	end,
})

-- function to set autogroups easily
-- https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_autocmd.lua
local function augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
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
		{ "BufEnter,FocusGained,InsertLeave", "*", [[if &ft !~# 'dashboard' | set relativenumber | endif]] },
		{ "BufLeave,FocusLost,InsertEnter", "*", [[if &ft !~# 'dashboard' | set norelativenumber | endif]] },
	},
}
augroups(autocmds)
