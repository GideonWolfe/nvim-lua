local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Let packer manage itself
	use({ "wbthomason/packer.nvim" })

	-- Configs for LSP
	use({ "neovim/nvim-lspconfig" })
	-- use {
	-- 'kabouzeid/nvim-lspinstall'
	-- config = function()
	--   require('configs.treesitter')
	-- end,
	-- }

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		config = function()
			require("configs.luasnip")
		end,
	})
	use({ "rafamadriz/friendly-snippets" })

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.cmp")
		end,
	})
	use({
		"hrsh7th/cmp-buffer",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"hrsh7th/cmp-path",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"hrsh7th/cmp-cmdline",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"saadparwaiz1/cmp_luasnip",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"hrsh7th/cmp-emoji",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"hrsh7th/cmp-nvim-lua",
		requires = { "hrsh/nvim-cmp" },
	})
	use({
		"zbirenbaum/copilot-cmp",
		requires = { "hrsh/nvim-cmp" },
	})
	-- use({
	-- 	"tzachar/cmp-tabnine",
	-- 	run = "./install.sh",
	-- 	requires = { "hrsh/nvim-cmp" },
	-- })

	-- Symbols for LSP preview
	use({ "onsails/lspkind-nvim" })

	-- Show LSP errors/diagnostics in pretty list
	use({
		"folke/trouble.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("configs.trouble")
		end,
	})

	-- Show LSP TODOs/HACKs in pretty list
	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.todocomments")
		end,
	})

	-- Show function signatures in floating window
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("configs.lsp_signature")
		end,
	})

	-- Use alternating colors for nested perens
	use({
		"p00f/nvim-ts-rainbow",
		config = function()
			require("configs.tsrainbow")
		end,
	})

	-- Pretty symbols
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	})

	-- Highlights
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
	})

	-- Indentation tracking
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("configs.indent-blankline")
		end,
	})

	-- Wal colorscheme and wpgtk for alt
	use("dylanaraps/wal.vim")
	use("deviantfero/wpgtk.vim")
	use("nekonako/xresources-nvim")

	-- Git signs in the gutter
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
		requires = { "nvim-lua/plenary.nvim" },
		event = "BufRead",
	})

	-- Colorize color codes
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("configs.colorizer")
		end,
		-- ft = {'css', 'javascript', 'json', 'scss', 'vim'}
		ft = {},
	})

	-- Auto commenting
	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("configs.kommentary")
		end,
	})

	-- Status line
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		-- your statusline
		-- config = function()
		-- 	require("configs.galaxyline")
		-- end,
		config = function()
			require("configs.galaxyline.chadline")
		end,
		-- some optional icons
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Tab bar
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("configs.barbar")
		end,
	})

	-- A File Explorer For Neovim Written In Lua
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("configs.nvimtree")
		end,
		-- devicons in lua
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Searching and finding
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("configs.telescope")
		end,
	})

	-- auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})

	-- Dashboard
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("configs.dashboard")
		end,
	})

	use({
		"nvim-telescope/telescope-media-files.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
	})

	-- Discord rich presence
	use({
		"andweeb/presence.nvim",
	})

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Hop to various locations in buffer
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("configs.hop")
		end,
	})

	-- Outline symbols/functions
	use({
		"simrat39/symbols-outline.nvim",
	})

	-- Add/delete/change surrounds
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})


	-- easy tables for markdown
	use({
		"dhruvasagar/vim-table-mode",
	})

  -- TODO this doesn't really work without TERMGUICOLORS
  -- color utilities
  use({
		"nvim-colortils/colortils.nvim",
		config = function()
			require("configs.colortils")
		end,
	})


	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
