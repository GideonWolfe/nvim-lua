local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
if not (present1 or present2) then
    return
end

local gls = gl.section

gl.short_line_list = {"packer", "NvimTree"}


-- Import some providers/extensions
local diagnostic = require("configs.galaxyline.providers.diagnostic")
local fileinfo = require("configs.galaxyline.providers.fileinfo")
local buffer = require("configs.galaxyline.providers.buffer")
local extension = require("configs.galaxyline.providers.extension")

-- Referencing a specific utility function from the provider file
-- many of these have defaults but we format them nice here
bufferIcon = buffer.get_buffer_type_icon
fileType = fileinfo.get_file_type
fileEncode = fileinfo.get_file_encode
fileName = fileinfo.get_current_file_name
scrollBar  = extension.scrollbar_instance
readOnly = fileinfo.file_readonly

local colors = {
    white = "#b5bcc9",
    darker_black = "#10171e",
    black = "#131a21", --  nvim bg
    black2 = "#1a2128",
    one_bg = "#1e252c",
    one_bg2 = "#272e35",
    one_bg3 = "#2a3138",
    grey = "#363d44",
    grey_fg = "#4e555c",
    grey_fg2 = "#51585f",
    light_grey = "#545b62",
    red = "#ef8891",
    baby_pink = "#fca2aa",
    pink = "#fca2af",
    line = "#20272e", -- for lines like vertsplit
    green = "#9ce5c0",
    vibrant_green = "#a5d4af",
    blue = "#99aee5",
    nord_blue = "#9aa8cf",
    yellow = "#fbdf90",
    sun = "#fbdf9a",
    purple = "#d7c1ed",
    dark_purple = "#ccaced",
    teal = "#92dbb6",
    orange = "#EDA685",
    cyan = "#b5c3ea",
    statusline_bg = "#181f26",
    lightbg = "#222930",
    lightbg2 = "#1d242b"
}


-- Custom vim mode indicator
-- https://elianiva.my.id/post/neovim-lua-statusline#mode-component
gls.left[1] = {
    viMode_icon = {
        provider = function()
            local alias = {
                n = "Normal",
                i = "Insert",
                c = "Command",
                V = "VisualLine",
                [''] = "VisualBlock",
                [''] = "SelectBlock",
                v = "Visual",
                --[[ R = "Replace",
                Rv = "VReplace",
                ce = "Ex",
                cv = "VimEx",
                r = "Prompt",
                rm = "More", ]]
            }
            -- TODO: incorporate these chars  
            local current_Mode = alias[vim.fn.mode()]
            if current_Mode == "Normal" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=green')
              return "   "
            elseif current_Mode == "Insert" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=red')
              return "   "
            elseif current_Mode == "Visual" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=blue')
              return "   "
            elseif current_Mode == "VisualLine" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=yellow')
              return "   "
            elseif current_Mode == "VisualBlock" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=cyan')
              return "   "
            elseif current_Mode == "Replace" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=lightgreen')
              return "  "
            elseif current_Mode == "Command" then
              vim.cmd('hi viModeHighlight ctermbg=black ctermfg=magenta')
              -- return "   "
              -- return "   "
              return "   "
            else
              return "? "
              -- return current_Mode 
            end
        end,
        separator = "",
        -- highlight = {colors.statusline_bg, colors.red},
        -- highlight = 'StatusLine',
        highlight = 'viModeHighlight', -- i made this hl group up
        -- highlight = {'black', 'red'},
        separator_highlight = {colors.red, colors.statusline_bg}
    }
}


gls.left[2] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. " "
        end,
        highlight = {colors.grey_fg2, colors.lightbg2},
        -- separator = " ",
        separator = " ",
        separator_highlight = {colors.lightbg2, colors.statusline_bg}
    }
}


gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
    }
}

gls.left[4] = {
    FileName = {
        provider = fileName,
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg},
        separator = "",
        separator_highlight = {colors.lightbg, colors.lightbg2}
    }
}
local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        -- alt look, supposed to be square plus
        -- icon = ' ',
        -- highlight = {colors.white, colors.statusline_bg}
        highlight = 'GitSignsAdd'
    }
}

gls.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "  ",
        -- highlight = {colors.grey_fg2, colors.statusline_bg}
        highlight = 'GitSignsChange'
    }
}

gls.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        -- icon = "  ",
        -- highlight = {colors.grey_fg2, colors.statusline_bg}
        highlight = 'GitSignsDelete'
    }
}


-- Just a separator for the git and errors
gls.left[8] = {
  Space = {
    provider = "WhiteSpace",
    condition = require("galaxyline.condition").check_git_workspace,
    separator = "",
  },
}

gls.left[9] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        -- highlight = {colors.yellow, colors.statusline_bg}
        highlight = 'LspDiagnosticsDefaultHint'
    }
}

gls.left[10] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        -- highlight = {colors.yellow, colors.statusline_bg}
        highlight = 'LspDiagnosticsDefaultWarning'
    }
}

gls.left[11] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        -- highlight = {colors.red, colors.statusline_bg}
        highlight = 'LspDiagnosticsDefaultError'
    }
}

gls.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        vim.cmd('hi lspActive ctermbg=black ctermfg=blue') -- set custom highlight group
                        return " " .. "  " .. " LSP "
                    end
                end
                return ""
            else
                return ""
            end
        end,
        highlight = 'lspActive'
    }
}

gls.right[2] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.grey_fg2, colors.statusline_bg},
        separator = " ",
        separator_highlight = {colors.statusline_bg, colors.statusline_bg}
    }
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.right[4] = {
    FileType = {
        provider = fileType,
        separator = " ",
        -- highlight = {c.Color('base'), c.Color('purple')}
    }
}

gls.right[5] = {
    some_icon = {
        provider = function()
            return ""
        end,
        -- separator = "",
        separator = " ",
        separator_highlight = {colors.green, colors.lightbg},
        highlight = {colors.lightbg, colors.green}
    }
}

gls.right[6] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "  Top "
            elseif current_line == vim.fn.line("$") then
                return "  Bot "
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "  " .. result .. "% "
        end,
        highlight = {colors.green, colors.lightbg}
    }
}

gls.right[7] = {
  FileSize = {
    provider = 'FileSize',
    condition = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
      end,
    icon = ' ',
    highlight = {colors.green,colors.purple},
    separator = " ",
    -- separator_highlight = {colors.purple,colors.darkblue},
  }
}

gls.right[8] = {
    ScrollBar = {
        provider = scrollBar,
        condition = condition.buffer_not_empty,
        -- highlight = {c.Color('yellow'), c.Color('purple')}
    }
}

-- gls.right[9] = {
--     Space = {
--         provider = function() return ' ' end,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.bg},
--         highlight = {colors.orange, colors.bg}
--     }
-- }



-- On short lines, show the buffer type
gls.short_line_right[1] = {
    BufferIcon = {
        provider = bufferIcon,
        -- separator = i.slant.Left,
        -- separator_highlight = {c.Color('purple'), c.Color('bg')},
        -- highlight = {c.Color('base'), c.Color('purple')}
    }
}
