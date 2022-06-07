_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

return require('packer').startup {
    function(use)

        use 'wbthomason/packer.nvim'

        ----------------------------------------------
        -- https://github.com/romgrk/barbar.nvim
        --  TODO  Make use of it
        -- use 'ThePrimeagen/harpoon'

        use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
        use 'sidebar-nvim/sidebar.nvim'
        use {
            'folke/todo-comments.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('todo-comments').setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

        --  TODO  play with it
        use 'preservim/tagbar' -- easy way to browse the tags of the current file

        -- How it looks
        use 'alexvyber/vim-one' -- theme (includes both One Dark and One Light)
        -- use 'vim-airline/vim-airline'
        -- use 'vim-airline/vim-airline-themes'

        -- used by lsp
        use 'tjdevries/nlua.nvim'

        -- Pretty colors
        use 'norcalli/nvim-colorizer.lua'

        -- Great comments
        use {
            'numToStr/Comment.nvim',
            config = function() require('Comment').setup() end
        }

        use 'tjdevries/colorbuddy.nvim' -- Used to render treesitter output?

        -- Snippents
        -- use 'L3MON4D3/LuaSnip'

        -- LSP Plugins:
        -- NOTE: lspconfig ONLY has configs, for people reading this :)
        -- use 'neovim/nvim-lspconfig'
        -- use 'wbthomason/lsp-status.nvim'
        -- use 'j-hui/fidget.nvim'

        use {
            'ericpubu/lsp_codelens_extensions.nvim',
            config = function()
                require('codelens_extensions').setup()
            end
        }

        -- use 'jose-elias-alvarez/null-ls.nvim'
        -- use 'tjdevries/lsp_extensions.nvim'
        -- use 'onsails/lspkind-nvim'

        use 'ray-x/go.nvim'
        use 'jose-elias-alvarez/nvim-lsp-ts-utils'

        use {
            'folke/lsp-trouble.nvim',
            cmd = 'Trouble',
            config = function()
                -- Can use P to toggle auto movement
                require('trouble').setup {
                    auto_preview = false,
                    auto_fold = true
                }
            end
        }

        -- use 'tjdevries/tree-sitter-lua'
        -- use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'

        use 'nvim-telescope/telescope.nvim'
        -- use 'nvim-telescope/telescope-fzf-writer.nvim'
        -- use 'nvim-telescope/telescope-packer.nvim'
        use 'nvim-telescope/telescope-fzy-native.nvim'
        -- use 'nvim-telescope/telescope-github.nvim'
        use 'nvim-telescope/telescope-symbols.nvim'

        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        use {'nvim-telescope/telescope-hop.nvim'}
        use {'nvim-telescope/telescope-ui-select.nvim'}

        use {
            'AckslD/nvim-neoclip.lua',
            config = function() require('neoclip').setup() end
        }

        use 'tjdevries/green_light.nvim'

        use {'nvim-telescope/telescope-smart-history.nvim'}
        use 'nvim-telescope/telescope-frecency.nvim'
        use 'nvim-telescope/telescope-cheat.nvim'

        use {
            'antoinemadec/FixCursorHold.nvim',
            run = function() vim.g.curshold_updatime = 1000 end
        }

        --  TODO  make use of it
        -- STREAM: Alternate file editting and some helpful stuff
        -- use {'tpope/vim-projectionist', enable = false}

        -- For narrowing regions of text to look at them alone
        -- use {'chrisbra/NrrwRgn', cmd = {'NarrowRegion', 'NarrowWindow'}}

        -- use 'tweekmonster/spellrotate.vim'
        -- use 'haya14busa/vim-metarepeat' -- Never figured out how to use this, but looks like fun.
        --

        use {
            'norcalli/nvim-terminal.lua',
            config = function() require('terminal').setup() end
        }

        -- Make comments appear IN YO FACE
        use {
            'tjdevries/vim-inyoface',
            config = function()
                vim.api.nvim_set_keymap('n', '<leader>cc',
                    '<Plug>(InYoFace_Toggle)', {})
            end
        }

        -- Show only what you're searching for.
        -- STREAM: Could probably make this a bit better. Definitely needs docs
        -- use "tjdevries/fold_search.vim"

        use {
            'tpope/vim-scriptease',
            cmd = {
                'Messages', -- view messages in quickfix list
                'Verbose', -- view verbose output in preview window.
                'Time' -- measure how long it takes to run some stuff.
            }
        }

        --  TODO  Figure it out
        -- Quickfix enhancements. See :help vim-qf
        -- use 'romainl/vim-qf'

        use {
            'glacambre/firenvim',
            run = function() vim.fn['firenvim#install'](0) end
        }

        -- TODO: Eventually statusline should consume this.
        -- use 'mkitt/tabline.vim'

        -- use 'kyazdani42/nvim-web-devicons'
        -- use 'yamatsum/nvim-web-nonicons'

        -- TODO: This would be cool to add back, but it breaks sg.nvim for now.
        -- use "lambdalisue/vim-protocol"

        --   FOCUSING:
        local use_folke = true
        if use_folke then
            use 'folke/zen-mode.nvim'
            use 'folke/twilight.nvim'
        else
            use {'junegunn/goyo.vim', cmd = 'Goyo', disable = use_folke}
            use {
                'junegunn/limelight.vim',
                after = 'goyo.vim',
                disable = use_folke
            }
        end

        --  LANGUAGE:
        -- TODO: Should check on these if they are the best ones
        -- use {'neovimhaskell/haskell-vim', ft = 'haskell'}
        -- use {'elzr/vim-json', ft = 'json'}
        -- use {'goodell/vim-mscgen', ft = 'mscgen'}
        -- use 'PProvost/vim-ps1'
        -- use 'justinmk/vim-syntax-extra'

        -- Typescript
        -- if false then
        --     use 'jelera/vim-javascript-syntax'
        --     use 'othree/javascript-libraries-syntax.vim'
        --     use 'leafgarland/typescript-vim'
        --     use 'peitalin/vim-jsx-typescript'
        --     use {'vim-scripts/JavaScript-Indent', ft = 'javascript'}
        --     use {'pangloss/vim-javascript', ft = {'javascript', 'html'}}
        -- end

        -- Wonder if I can make LSP do this and respect .prettier files.
        -- I don't write enough typescript to think about this.
        use {
            'prettier/vim-prettier',
            ft = {'html', 'javascript', 'typescript', 'typescriptreact'},
            run = 'yarn install'
        }

        -- Completion

        -- Sources
        use 'hrsh7th/nvim-cmp'
        -- use 'hrsh7th/cmp-cmdline'
        -- use 'hrsh7th/cmp-buffer'
        -- use 'hrsh7th/cmp-path'
        -- use 'hrsh7th/cmp-nvim-lua'
        -- use 'hrsh7th/cmp-nvim-lsp'
        -- use 'hrsh7th/cmp-nvim-lsp-document-symbol'
        -- use 'saadparwaiz1/cmp_luasnip'
        -- use 'tamago324/cmp-zsh'

        -- Comparators
        use 'lukas-reineke/cmp-under-comparator'

        -- Completion stuff
        use 'tjdevries/rofl.nvim'

        -- Cool tags based viewer
        --   :Vista  <-- Opens up a really cool sidebar with info about file.
        -- use {'liuchengxu/vista.vim', cmd = 'Vista'}

        -- Find and replace
        -- use 'windwp/nvim-spectre'

        -- Debug adapter protocol
        -- use 'mfussenegger/nvim-dap'
        -- use 'rcarriga/nvim-dap-ui'
        -- use 'theHamsta/nvim-dap-virtual-text'
        -- use 'nvim-telescope/telescope-dap.nvim'

        -- use 'mfussenegger/nvim-dap-python'
        -- use 'jbyuki/one-small-step-for-vimkind'

        -- TREE SITTER:
        use 'nvim-treesitter/nvim-treesitter'
        -- use 'nvim-treesitter/playground'
        -- use 'vigoux/architext.nvim'

        -- TODO: YouTube Highlight
        -- use 'danymat/neogen'

        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        use {
            'mfussenegger/nvim-ts-hint-textobject',
            config = function()
                vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
                vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
            end
        }

        -- NAVIGATION:
        -- STREAM: Show off edit_alternate.vim
        use {
            'tjdevries/edit_alternate.vim',
            config = function()
                vim.fn['edit_alternate#rule#add']('go', function(filename)
                    if filename:find '_test.go' then
                        return (filename:gsub('_test%.go', '.go'))
                    else
                        return (filename:gsub('%.go', '_test.go'))
                    end
                end)

                vim.api.nvim_set_keymap('n', '<leader>ea',
                    '<cmd>EditAlternate<CR>', {silent = true})
            end
        }

        -- use 'tamago324/lir.nvim'
        -- use 'tamago324/lir-git-status.nvim'

        -- TODO  make use of it
        -- https://github.com/pechorin/any-jump.vim
        -- use 'pechorin/any-jump.vim'

        -- TODO: Check out macvhakann/vim-sandwich at some point
        -- use 'tpope/vim-surround' -- Surround text objects easily

        -- GIT:
        -- use 'TimUntersberger/neogit'

        -- Github integration
        -- use 'ruifm/gitlinker.nvim'

        -- Sweet message committer
        -- use 'rhysd/committia.vim'
        -- use 'sindrets/diffview.nvim'

        -- Async signs!
        -- use 'lewis6991/gitsigns.nvim'

        --  TODO  Make use of it
        use { -- Git worktree utility
            'ThePrimeagen/git-worktree.nvim',
            config = function() require('git-worktree').setup {} end
        }

        use 'tjdevries/standard.vim'
        use 'tjdevries/conf.vim'

        use {'junegunn/fzf', run = './install --all'}
        use {'junegunn/fzf.vim'}

    end

}
