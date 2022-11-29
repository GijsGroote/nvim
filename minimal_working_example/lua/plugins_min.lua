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
    -- PUT PACKAGE HERE WHICH YOU'D LIKE TO TEST



    -- use 'lervag/vimtex'
    -- -- LuaSnip
    -- use {
    --   "L3MON4D3/LuaSnip",
    --   tag = "v<CurrentMajor>.*",
    --   config = function()
    --     require("config.luasnip").setup()
    --   end,
    -- }
    --
    -- use {'tpope/vim-dispatch'}


    -- PUT PACKAGE HERE ABOVE WHICH YOU'D LIKE TO TEST

    -- Nvimtree allowed to navigate around
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
    -- which key (Allowed because nice for debuggig)
    use {"folke/which-key.nvim",
    event = "vimEnter",
    config = function()
      require("config.whichkey").setup()
    end,
  }

end
packer_init()
local packer = require "packer"

packer.init(conf)
packer.startup(plugins)
end

return M
