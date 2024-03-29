local M = {}

function M.setup()

	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},

		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			}
			vim.cmd [[packadd packer.nvim]]
		end
		vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
	end

	-- Plugins
	local function plugins(use)
		use { "wbthomason/packer.nvim" }

		-- Colorscheme
		use {
			"folke/tokyonight.nvim",
			config = function()
				vim.cmd "colorscheme tokyonight"
			end,
			disable = false,
		}
		use {
			"sainnhe/everforest",
			config = function()
				vim.g.everforest_better_performance = 1
				vim.cmd "colorscheme everforest"
			end,
			disable = true,
		}
		use {
			"arcticicestudio/nord-vim",
			config = function()
				vim.cmd "colorscheme nord"
			end,
			disable = true,
		}
		use {
			"norcalli/nvim-colorizer.lua",
			cmd = "ColorizerToggle",
			config = function()
				require("colorizer").setup()
			end,
		}

		-- Startup screen
		use {
			"goolord/alpha-nvim",
			config = function()
				require("config.alpha").setup()
			end,
		}

    -- Vimtex for latex documents
    use {'lervag/vimtex'}

		-- Better Comment
		use {
			"numToStr/Comment.nvim",
			opt = true,
			keys = { "gcc", "gbc" },
			config = function()
        require("Comment").setup {}
      end,
    }

    -- IndentLine
		use {
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre",
			config = function()
				require("config.indentblankline").setup()
			end,
		}

		use {
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icons
			},
			config = function()
				require("config.nvimtree").setup()
			end,

			tag = "nightly" -- optional, updated every week. (see issue #1193)
		}

		-- Whichkey
		use {
			"folke/which-key.nvim",
			event = "vimEnter",
			config = function()
				require("config.whichkey").setup()
      end,
    }

    -- fuzzy file search 
    use { "junegunn/fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }
    use {
      "ibhagwan/fzf-lua",
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      wants = { "nvim-lsp-installer" },
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        "williamboman/nvim-lsp-installer",
      },
    }

    -- Harpoon
    use {"nvim-lua/plenary.nvim"}
    use {"ThePrimeagen/harpoon"}

    -- highlight color definitions
    use {"chrisbra/Colorizer"}

    -- ALE (Asynchronous Lint Engine)
    use {"dense-analysis/ale"}

    -- LuaSnip
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("config.luasnip").setup()
      end,
    }

    -- Zen mode
    use({
      "Pocco81/true-zen.nvim",
      config = function()
        require("true-zen").setup {
          -- your config goes here
          -- or just leave it empty :)
        }
      end,
    }) 

    -- absolute and relative line numbering
    use {
      "sitiom/nvim-numbertoggle",
      config = function()
        require("numbertoggle").setup()
      end
    }
  end
  packer_init()
  local packer = require "packer"

  packer.init(conf)
  packer.startup(plugins)
end

return M
