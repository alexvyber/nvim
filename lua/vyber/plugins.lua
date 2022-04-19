
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Comment.nvim
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- How it looks
    -- use 'alexvyber/vim-one'
    -- use 'mhinz/vim-startify'
    use 'tjdevries/colorbuddy.nvim'

    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    use 'sidebar-nvim/sidebar.nvim'

    -- https://github.com/romgrk/barbar.nvim
    use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}
    --     -- LSP Plugins
    --     -- NOTE: lspconfig ONLY has configs, for people reading this :)
    --     use 'neovim/nvim-lspconfig'
    --     use 'wbthomason/lsp-status.nvim'
    --     use 'j-hui/fidget.nvim'
    --     use {
    --         'ericpubu/lsp_codelens_extensions.nvim',
    --         config = function() require('codelens_extensions').setup() end
    --     }
    --     use 'jose-elias-alvarez/null-ls.nvim'

    --     -- local_use "lsp_extensions.nvim"
    --     use 'onsails/lspkind-nvim'

    --     -- Defaults that makes me happy
    --     use 'tpope/vim-sensible'

    --     use 'nvim-treesitter/nvim-treesitter'

    --     use 'nvim-lua/plenary.nvim'

    -- Completion

    --     -- Sources
    --     use 'hrsh7th/nvim-cmp'
    --     -- use "hrsh7th/cmp-cmdline"
    --     use 'hrsh7th/cmp-buffer'
    --     use 'hrsh7th/cmp-path'
    --     use 'hrsh7th/cmp-nvim-lua'
    --     use 'hrsh7th/cmp-nvim-lsp'
    --     use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    --     use 'saadparwaiz1/cmp_luasnip'
    --     use 'tamago324/cmp-zsh'

    -- -- Quickfix enhancements. See :help vim-qf
    -- use 'romainl/vim-qf'

    --     use {
    --         'glacambre/firenvim',
    --         run = function() vim.fn['firenvim#install'](0) end
    --     }
    --     use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    --     use {
    --         'folke/lsp-trouble.nvim',
    --         cmd = 'Trouble',
    --         config = function()
    --             -- Can use P to toggle auto movement
    --             require('trouble').setup {auto_preview = false, auto_fold = true}
    --         end
    --     }

    -- use 'rcarriga/nvim-notify'

    --     use 'tjdevries/green_light.nvim'

    --     use 'tjdevries/nlua.nvim'
    --     use 'tjdevries/gruvbuddy.nvim'

    --     use 'norcalli/nvim-colorizer.lua'

    --     use 'theHamsta/nvim-dap-virtual-text'

    --     use 'tamago324/lir.nvim'
    --     use 'tamago324/lir-git-status.nvim'
    --     use 'kyazdani42/nvim-web-devicons'
    --     if is_linux then use 'yamatsum/nvim-web-nonicons' end

    -- use 'elixir-editors/vim-elixir'
    -- use {'neoclide/coc.nvim',  branch= 'release' }
    -- use {'amiralies/coc-elixir', do= 'yarn install && yarn prepack'}
    use 'scrooloose/nerdtree' --  file tree
    use 'alexvyber/vim-one' -- theme (includes both One Dark and One Light)
    -- use 'dense-analysis/ale' -- Asynchronous linter
    -- use 'haya14busa/incsearch.vim' -- Improved incremental searching
    -- use 'machakann/vim-highlightedyank' -- highlighted yank
    -- use 'mhinz/vim-startify' -- startup page
    -- use 'bronson/vim-visual-star-search' -- select text, then press * or # to search for it
    use 'tpope/vim-commentary' -- (Un)commenting lines
    -- use 'tpope/vim-repeat' -- Use dot operator with plugins
    -- use 'tpope/vim-sensible' -- Defaults everyone can agree on
    -- use 'tpope/vim-surround' -- Commands to work with surroundings
    use 'junegunn/fzf' -- fuzzy finder for files/buffers/etc
    use 'junegunn/fzf.vim' -- vim plugin for fzf
    -- use 'stefandtw/quickfix-reflector.vim' --  Make quickfix window editable
    -- use 'vim-airline/vim-airline' -- status line replacement
    -- use 'vim-airline/vim-airline-themes'
    use 'prabirshrestha/asyncomplete.vim' -- autocomplete
    use 'prabirshrestha/asyncomplete-buffer.vim' -- autocomplete using contents of current buffer
    -- use 'ElmCast/elm-vim' -- elm-format on autosave
    -- use 'sheerun/vim-polyglot' -- syntax highlighting for lots of things
    -- use 'danro/rename.vim' -- adds :Rename command
    -- use 'arp242/auto_mkdir2.vim' -- automatically create directories as needed when writing


    -- https://github.com/folke/todo-comments.nvim
    use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

end)
