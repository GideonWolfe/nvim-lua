-- Packer config comes from author of packer 
-- https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/lua/plugins.lua
local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  -- Let packer manage itself
  use 'wbthomason/packer.nvim'
   
  -- Configs for LSP
  use 'neovim/nvim-lspconfig'
  -- use {
    -- 'kabouzeid/nvim-lspinstall'
    -- config = [[require('configs.treesitter')]]
  -- }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    config = function()
        require "configs.luasnip"
    end
  }

  use {
    "rafamadriz/friendly-snippets",
  }
  -- Autocomplete for LSP
  use { 'hrsh7th/nvim-compe', config = [[require('configs.compe')]], event = 'InsertEnter *' }
  -- Symbols for LSP preview
  use {'onsails/lspkind-nvim'}

  -- Show LSP errors/diagnostics in pretty list
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('configs.trouble')]]
  }
  
  -- Show LSP TODOs/HACKs in pretty list
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require('configs.todocomments')]]
  }


  -- Show function signatures in floating window
  use {'ray-x/lsp_signature.nvim', config = [[require('configs.lsp_signature')]]}  

  -- Use alternating colors for nested perens
  -- TODO broken throws errors FIX
  --use {'p00f/nvim-ts-rainbow', config = [[require('configs.tsrainbow')]]}  

  -- Pretty symbols
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }

  --Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('configs.treesitter')]]
  }
  use {
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
  }


  -- Indentation tracking
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require('configs.indent-blankline')]]
  }

  -- Wal colorscheme and wpgtk for alt
  use 'dylanaraps/wal.vim'
  use 'deviantfero/wpgtk.vim'
  use 'nekonako/xresources-nvim'

  -- Git signs in the gutter
  use {
    'lewis6991/gitsigns.nvim',
    config = [[require('configs.gitsigns')]],
    requires = {
      'nvim-lua/plenary.nvim'
    },
    event = 'BufRead'
  }

  -- Colorize color codes
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require('configs.colorizer')]],
    -- ft = {'css', 'javascript', 'json', 'scss', 'vim'}
    ft = {}
  }


  -- auto commenting
  use {
    'b3nj5m1n/kommentary',
    config = [[require('configs.kommentary')]],
  }

  -- Status line
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    -- config = [[require('configs.galaxyline')]],
    config = [[require('configs.galaxyline.chadline')]],
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Tab bar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require("configs.barbar")
    end
  }

  -- A File Explorer For Neovim Written In Lua
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeRefresh",
      "NvimTreeFindFile"
    },
    -- devicons in lua
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      -- require("configs.nvimtree")
      require("configs.nvimtree").config()
    end
  }

  -- Searching and finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('configs.telescope')]]
  }

  -- auto pairs
  use {
    'windwp/nvim-autopairs',
    after = "nvim-compe",
    config = function()
      require "configs.autopairs"
    end
  }

  -- Dashboard
  use {
    'glepnir/dashboard-nvim',
    config = [[require('configs.dashboard')]]
  }


  use {
    'nvim-telescope/telescope-media-files.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope.nvim'}},
    -- config = [[require('configs.telescopemedia')]]
  }

  -- Discord rich presence
  use {
    'andweeb/presence.nvim',
  }


end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})
return plugins
