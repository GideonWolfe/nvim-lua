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


-- Set number gutter to transparent
-- Workaround to use autocommand since it isnt respected otherwise
-- https://www.reddit.com/r/neovim/comments/me35u9/lua_config_to_set_highlight/
-- cmd[[au VimEnter * highlight LineNr ctermfg=white ctermbg=black]] 
cmd[[au VimEnter * highlight SignColumn ctermbg=black]] 
-- set pmenu to transparent
cmd[[au VimEnter * highlight Pmenu ctermfg=white ctermbg=black]] 
cmd[[au VimEnter * highlight PmenuSel ctermfg=green ctermbg=black]] 
--TODO: why do scrollbar stuff not work?
--cmd[[au VimEnter * highlight PmenuSbar ctermfg=blue ctermbg=white]] 
--cmd[[au VimEnter * highlight PmenuSbar ctermbg=cyan]] 
--cmd[[au VimEnter * highlight PmenuThumb ctermbg=red]] 
-- set gutter to transparent

-- Colors for diagnostics and errors
-- cmd[[au VimEnter * highlight LspDiagnosticsDefaultError ctermfg=red]] 
-- cmd[[au VimEnter * highlight LspDiagnosticsDefaultWarning ctermfg=yellow]] 
-- cmd[[au VimEnter * highlight LspDiagnosticsDefaultInformation ctermfg=green]] 
-- cmd[[au VimEnter * highlight LspDiagnosticsDefaultHint ctermfg=blue]] 
cmd[[au VimEnter * highlight DiagnosticsError ctermfg=red]]
cmd[[au VimEnter * highlight DiagnosticsWarn ctermfg=yellow]]
cmd[[au VimEnter * highlight DiagnosticsInfo ctermfg=green]]
cmd[[au VimEnter * highlight DiagnosticsHint ctermfg=blue]]

-- Get more specific: Errors for virtual text only for example
cmd[[au VimEnter * highlight DiagnosticVirtualTextError cterm=italic ctermfg=red]]
cmd[[au VimEnter * highlight DiagnosticVirtualTextWarn cterm=italic ctermfg=yellow]]
cmd[[au VimEnter * highlight DiagnosticVirtualTextInfo cterm=italic ctermfg=green]]
cmd[[au VimEnter * highlight DiagnosticVirtualTextHint cterm=italic ctermfg=blue]]

-- Underline Colors
cmd[[au VimEnter * highlight DiagnosticUnderlineError cterm=NONE ctermfg=red ]]
cmd[[au VimEnter * highlight DiagnosticUnderlineWarn ctermfg=yellow]]
cmd[[au VimEnter * highlight DiagnosticUnderlineInfo ctermfg=green]]
cmd[[au VimEnter * highlight DiagnosticUnderlineHint ctermfg=blue]]

-- Floating Colors
cmd[[au VimEnter * highlight DiagnosticFloatingError ctermfg=red]]
cmd[[au VimEnter * highlight DiagnosticFloatingWarn ctermfg=yellow]]
cmd[[au VimEnter * highlight DiagnosticFloatingInfo ctermfg=green]]
cmd[[au VimEnter * highlight DiagnosticFloatingHint ctermfg=blue]]

-- LSP Sign colors
-- the actual sign and color are defined in the lsp config
cmd[[au VimEnter * highlight DiagnosticSignError ctermfg=red]]
cmd[[au VimEnter * highlight DiagnosticSignWarn ctermfg=yellow]]
cmd[[au VimEnter * highlight DiagnosticSignInfo ctermfg=green]]
cmd[[au VimEnter * highlight DiagnosticSignHint ctermfg=blue]]

-- Git Sign colors
cmd[[au VimEnter * highlight GitSignsAdd ctermfg=green ctermbg=black]] 
cmd[[au VimEnter * highlight GitSignsChange ctermfg=yellow ctermbg=black]] 
cmd[[au VimEnter * highlight GitSignsDelete ctermfg=red ctermbg=black]] 

-- Status line colors
-- TODO: why does black show up as gray
cmd[[au VimEnter * highlight StatusLine ctermfg=red ctermbg=black]] 
-- cmd[[au VimEnter * highlight StatusLineNC ctermfg=blue ctermbg=black]] 
cmd[[au VimEnter * highlight StatusLineNC ctermfg=black ctermbg=black]] 

-- Color of vertical line split
-- TODO: not sure why this is backwards
cmd[[au VimEnter * highlight VertSplit ctermfg=cyan ctermbg=black]] 

-- Mispells
cmd[[au VimEnter * highlight SpellBad cterm=italic ctermfg=red ctermbg=black]] 
-- Should start with a capital
cmd[[au VimEnter * highlight SpellCap ctermfg=yellow ctermbg=black]] 
-- cmd[[au VimEnter * highlight SpellLocal ctermfg=cyan ctermbg=black]] 
-- cmd[[au VimEnter * highlight SpellRare ctermfg=cyan ctermbg=black]] 

-- Color of line numbers
-- cmd[[au VimEnter * highlight LineNr ctermfg=blue]] 
-- Color of current line number
cmd[[au VimEnter * highlight CursorLineNr cterm=bold ctermbg=black ctermfg=green]] 

-- HACK: in order to prevent treesitter + wpgtk from highlighting
-- all punctuation in light grey
cmd[[au VimEnter * highlight Delimiter ctermbg=black]] 


-- Set the color of TODO, HACK
cmd[[au VimEnter * highlight Todo ctermbg=black ctermfg=yellow cterm=bold]] 


--colorscheme
--TODO: hides cursor on whitespace?
-- cmd [[colorscheme wal]]
--TODO: these highlight all punctuation with treesitter?
cmd [[colorscheme wpgtk]]
-- cmd [[colorscheme wpgtkAlt]]
--
-- -- Set number gutter to transparent
-- Workaround to use autocommand since it isnt respected otherwise
-- https://www.reddit.com/r/neovim/comments/me35u9/lua_config_to_set_highlight/
cmd[[au VimEnter * highlight LineNr ctermfg=white ctermbg=black]] 
cmd[[au VimEnter * highlight SignColumn ctermbg=black]] 
-- set pmenu to transparent
cmd[[au VimEnter * highlight Pmenu ctermfg=white ctermbg=black]] 
cmd[[au VimEnter * highlight PmenuSel ctermfg=green ctermbg=black]] 


-- Telescope highlight groups
cmd[[highlight TelescopeSelection ctermfg=green ctermbg=black cterm=bold]] -- best match
cmd[[highlight TelescopeSelectionCaret ctermfg=red ctermbg=black cterm=bold]] -- caret/target symbol
cmd[[highlight TelescopeMultiSelection ctermfg=green ctermbg=red]]
-- cmd[[highlight TelescopeNormal ctermfg=green ctermbg=black]] -- default text color
cmd[[highlight TelescopeBorder ctermfg=yellow ctermbg=black]]
cmd[[highlight TelescopePromptBorder ctermfg=cyan ctermbg=black cterm=bold]]
cmd[[highlight TelescopeResultsBorder ctermfg=red ctermbg=black]]
cmd[[highlight TelescopePreviewBorder ctermfg=yellow ctermbg=black]]
cmd[[highlight TelescopeMatching ctermfg=cyan ctermbg=black]] -- colors matching input
cmd[[highlight TelescopePromptPrefix ctermfg=red ctermbg=black]]



-- Trouble colors
cmd[[highlight TroubleCount ctermfg=red ctermbg=black cterm=bold]] -- number of issues in file


-- Dashboard colors
cmd[[highlight DashboardHeader ctermfg=red ctermbg=black cterm=bold]] -- dashboard image
cmd[[highlight DashboardCenter ctermfg=blue ctermbg=black]] -- dashboard image
cmd[[highlight DashboardCenterIcon ctermfg=green ctermbg=black]] -- dashboard image
cmd[[highlight DashboardShortcut ctermfg=red ctermbg=black]] -- dashboard image
cmd[[highlight DashboardFooter ctermfg=cyan ctermbg=black]] -- dashboard image


-- BarBar tab line colors
-- https://github.com/romgrk/barbar.nvim/blob/b3695e9825e33cd534d142383271557755370f3f/doc/barbar.txt#L79
cmd[[highlight BufferTabpageFill ctermfg=black ctermbg=black]] -- background of empty space
cmd[[highlight BufferCurrent ctermfg=cyan ctermbg=black cterm=bold]] -- current buffer text color
cmd[[highlight BufferCurrentSign ctermfg=green ctermbg=black]] -- separator color of current buffer
cmd[[highlight BufferInactive ctermfg=white ctermbg=black]] -- inactive buffer text color
cmd[[highlight BufferInactiveSign ctermfg=white ctermbg=black]] -- separator color of inactive buffer
cmd[[highlight BufferInactiveMod ctermfg=red ctermbg=black]] -- color of inactive modified files




-- Hop highlight colors
-- :h hop-highlights
cmd[[highlight HopNextKey ctermfg=green ctermbg=black cterm=bold]]
cmd[[highlight HopNextKey1 ctermfg=blue ctermbg=black cterm=bold]]
cmd[[highlight HopNextKey2 ctermfg=yellow ctermbg=black cterm=bold]]
cmd[[highlight HopUnmatched ctermfg=red ctermbg=black cterm=bold]]
cmd[[highlight HopCursor ctermfg=cyan ctermbg=black cterm=bold]]
cmd[[highlight HopPreview ctermfg=magenta ctermbg=black cterm=bold]]

-- Symbols outline highlights
cmd[[highlight FocusedSymbol ctermfg=magenta ctermbg=black cterm=bold]]
