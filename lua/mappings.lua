-- import our vim objects
local vim, api, fn, g = vim, vim.api, vim.fn, vim.g

-- import our map functions file
local mappings = require('utils.map')

-- dereference all the functions
-- examples https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_mapping.lua
local nnoremap = mappings.nnoremap
local inoremap = mappings.inoremap
local vnoremap = mappings.vnoremap
local xnoremap = mappings.xnoremap
local cnoremap = mappings.cnoremap
local nmap = mappings.nmap
local imap = mappings.imap
local vmap = mappings.vmap


-- Set leader key to space
g.mapleader = " "

-- wrapper function around the native mapping function
-- sets some sane defaults
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- TODO: what is this?
function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

-- Helper functions to write create abbreveations
local function cnoreabbrev(command)
    api.nvim_command("cnoreabbrev " .. command)
end

local function iabbrev(command)
    api.nvim_command("iabbrev " .. command)
end


-- Allow misspellings
cnoreabbrev "Qa qa"
cnoreabbrev "Q q"
cnoreabbrev "Qall qall"
cnoreabbrev "Q! q!"
cnoreabbrev "Qall! qall!"
cnoreabbrev "qQ q@"
cnoreabbrev "Bd bd"
cnoreabbrev "bD bd"
cnoreabbrev "qw wq"
cnoreabbrev "Wq wq"
cnoreabbrev "WQ wq"
cnoreabbrev "Wq wq"
cnoreabbrev "Wa wa"
cnoreabbrev "wQ wq"
cnoreabbrev "W w"
cnoreabbrev "W! w!"

-- Yank from cursor position to end-of-line
nnoremap('Y', 'y$')

-- Select blocks after indenting
xnoremap("<", "<gv")
xnoremap(">", ">gv|")

-- Use tab for indenting
nnoremap("<Tab>", ">>_")
nnoremap("<S-Tab>", "<<_")
vnoremap("<Tab>", ">gv")
vnoremap("<S-Tab>", "<gv")


local opt = {}


-- jk or kj will enter normal mode 
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

-- Window movement
nmap('<c-h>', '<c-w>h')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('<c-l>', '<c-w>l')


-- COMPE STUFF
-- Helper functions for compe
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- TODO: causing some bugs
-- compe funcs WITH luasnip check
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif require("luasnip").expand_or_jumpable() then
        return t "<cmd>lua require'luasnip'.jump(1)<Cr>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif require("luasnip").jumpable(-1) then
        return t "<cmd>lua require'luasnip'.jump(-1)<CR>"
    else
        return t "<S-Tab>"
    end
end

-- luasnip keybinds
-- TODO: how to do "s" mode with the mapping helpers
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


-- Kommentary mappings
nmap("<leader>cic", "<Plug>kommentary_line_increase")
nmap("<leader>ci", "<Plug>kommentary_motion_increase")
xnoremap("<leader>cic", "<Plug>kommentary_visual_increase")
nmap("<leader>cdc", "<Plug>kommentary_line_increase")
nmap("<leader>cd", "<Plug>kommentary_motion_decrease")
xnoremap("<leader>cd", "<Plug>kommentary_visual_decrease")

-- Open NvimTree
-- vim.api.nvim_set_keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", {silent = true})
nnoremap("<leader>nt", ":NvimTreeToggle<CR>")

-- BarBar tab bar bindings
-- A is alt
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>')
map('n', '<A-.>', ':BufferNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ' :BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)


-- Telescope mappings
-- These mappings should start with "f" where possible "f"ind <something>
nnoremap('<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]]) -- Find files
nnoremap('<leader>fmf', [[<cmd>lua require('telescope').extensions.media_files.media_files()<cr>]]) -- find media file
nnoremap('<leader>fgf', [[<cmd>lua require('telescope.builtin').git_files()<cr>]]) -- Find git files
nnoremap('<leader>fb', [[<cmd>lua require('telescope.builtin').file_browser()<cr>]]) -- File Browser
nnoremap('<leader>fw', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]]) -- Find word
-- nnoremap('<leader>fb', [[<cmd>lua require('telescope.builtin').buffewrs()<cr>]])
nnoremap('<leader>fvh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]]) -- search vim help
nnoremap('<leader>fvc', [[<cmd>lua require('telescope.builtin').commands()<cr>]]) -- find vim command
nnoremap('<leader>fmp', [[<cmd>lua require('telescope.builtin').man_pages()<cr>]]) -- search man pages
nnoremap('<leader>qf', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]]) -- list quick fixes
nnoremap('<leader>fs', [[<cmd>lua require('telescope.builtin').spell_suggest()<cr>]]) -- suggest spelling
nnoremap('<leader>fkm', [[<cmd>lua require('telescope.builtin').keymaps()<cr>]]) -- find keymaps
nnoremap('<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]]) -- show references for obj under cursor
nnoremap('<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]]) -- show symbols in document
nnoremap('<leader>fws', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>]]) -- show symbols in workspace
nnoremap('<leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]]) -- code actions
nnoremap('<leader>fi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]])
nnoremap('<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]])
nnoremap('<leader>tp', [[<cmd>lua require('telescope.builtin').planets()<cr>]]) -- funny easter egg
nnoremap('<leader>tbi', [[<cmd>lua require('telescope.builtin').builtin()<cr>]]) -- choose builtin to launch
-- telescope git mappings
nnoremap('<leader>gco', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]]) -- git commits checkout: <cr> checkout, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
nnoremap('<leader>gbc', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]]) -- git buffer commits checkout
nnoremap('<leader>gbr', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]]) -- checkout action <cr>, track action <C-t> and rebase action<C-r>


-- Hop mappings
nnoremap('<leader>hw', ':HopWord<CR>') -- hop to a word
nnoremap('<leader>hc', ':HopChar1<CR>') -- type a character, hop to it
nnoremap('<leader>hl', ':HopLine<CR>') -- hop to a line



-- Mappings to move lines
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
inoremap("<A-j>", "<esc>:m .+1<CR>==")
inoremap("<A-v>", "<esc>:m .-2<CR>==")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")
