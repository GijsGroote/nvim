local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

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
			"sainnhe/everforest",
			config = function()
				vim.cmd "colorscheme everforest"
			end,
		}

		-- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
			end,
		}

		-- WhichKey
		use {
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				require("which-key").setup {

					triggers = "^", -- this trigger will prevent "d" and "g" to be triggers, use :WhichKey  
					-- old which key config
					-- use {
					-- "folke/which-key.nvim",
					-- 	config = function()
					-- 	require("config.whichkey").setup()
					-- 	end,
				}
			end
		}

		-- Neogit
		use {
			"TimUntersberger/neogit",
			cmd = "Neogit",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("config.neogit").setup()
			end,
		}

		 -- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = {"Ctrl-/", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy hopping
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("hop").setup {}
      end,
    }

    -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }
		
    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
			cmd = { "MarkdownPreview" },
		}

		use {
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = function()
				require("config.lualine").setup()
			end,
			requires = { "nvim-web-devicons" },
		}

		use {
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			module = "nvim-gps",
			config = function()
				require("nvim-gps").setup()
			end,
		}

		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter").setup()
			end,
		}

		use { "junegunn/fzf", run = "./install --all" }

		-- Coq
		use {
			"ms-jpq/coq_nvim",
			branch = "coq",
			event = "InsertEnter",
			opt = true,
			run = ":COQdeps",
			config = function()
				require("config.coq").setup()
			end,
			requires = {
				{ "ms-jpq/coq.artifacts", branch = "artifacts" },
				{ "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
			},
			disable = false,
		}	

		-- Auto pairs
		use {
			"windwp/nvim-autopairs",
			wants = "nvim-treesitter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("config.autopairs").setup()
			end,
		}
		-- use {
		-- 	"hrsh7th/nvim-cmp",
		-- 	event = "InsertEnter",
		-- 	opt = true,
		-- 	config = function()
		-- 		require("config.cmp").setup()
		-- 	end,
		-- 	wants = { "LuaSnip" },
		-- 	requires = {
		-- 		"hrsh7th/cmp-buffer",
		-- 		"hrsh7th/cmp-path",
		-- 		"hrsh7th/cmp-nvim-lua",
		-- 		"ray-x/cmp-treesitter",
		-- 		"hrsh7th/cmp-cmdline",
		-- 		"saadparwaiz1/cmp_luasnip",
		-- 		"hrsh7th/cmp-calc",
		-- 		"f3fora/cmp-spell",
		-- 		"hrsh7th/cmp-emoji",
		-- 		{
		-- 			"L3MON4D3/LuaSnip",
		-- 			wants = "friendly-snippets",
		-- 			config = function()
		-- 				require("config.luasnip").setup()
		-- 			end,
		-- 		},
		-- 		"rafamadriz/friendly-snippets",
		-- 		disable = false,
		-- 	},
		-- }
		--
	
		if packer_bootstrap then
			print "Restart Neovim required after installation!"
			require("packer").sync()
		end
	end

	packer_init()

	local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M