-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  }

  -- Colorscheme
  use { "rose-pine/neovim", as = "rose-pine" }
  use { "catppuccin/nvim", as = "catppuccin" }

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use "nvim-treesitter/playground"
  use "theprimeagen/harpoon"
  use "mbbill/undotree"
  use "tpope/vim-fugitive"

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
    },
  }

  -- File Tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  }

  ----------------------------------------------------------------------------

  use { "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } }

  use "elixir-editors/vim-elixir"
  -- use("wbthomason/packer.nvim")
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  use { "junegunn/fzf", run = "./install --all" }
  use { "junegunn/fzf.vim" }

  use "windwp/nvim-autopairs" -- e.g. after typing "(", automatically add the ")". I used to use "jiangmiao/auto-pairs"
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Comments
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- NvimTree
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, tag = "nightly" }

  -- LuaLine
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
end)
