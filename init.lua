-- If packer is not installed, should we install it?
if require('vyber.is_packer_installed')() then return end

-- Remap # to leader 
vim.cmd([[ map # <Nop> ]]) -- Remap # to to do nothing first
vim.g.mapleader = '#'

-- ·············································································
-- HACK  I was just learning lua and its possibilities
-- TODO  make rid of this
local vimrc_opts = {
    -- 'ab',
    'sets',
    'color',
    -- 'mappings',
    -- 'airline'
    -- 'commands',
    -- 'configs',
    -- 'fzf',
    -- 'go',
    -- 'nerdtree',
    -- 'plugins',
    -- 'snippets',
    -- 'TODO'
}
require('tmp.vimrc').setup(vimrc_opts)

local config_utils = require('vyber.utils')
local editor_settings = require('vyber.editor_settings')

config_utils.register_global_vars(editor_settings.GLOBAL_VARS)
config_utils.register({
    options = editor_settings.OPTIONS,
    keymaps = editor_settings.KEYMAPS,
    autocmds = editor_settings.AUTOCMDS
})

-- Turn off builtin plugins.
require 'vyber.disable_builtin'

-- Plugins
require('vyber.plugins')

-- https://github.com/numToStr/Comment.nvim
require('Comment').setup()

-- https://github.com/folke/todo-comments.nvim
require('todo-comments').setup({keywords = {TODO = {alt = {'WIP'}}}})

-- Treesitter
local treesitter_opts = require('vyber.treesitter-opts')
require'nvim-treesitter.configs'.setup(treesitter_opts)

vim.g.snippets = 'luasnip'

require('vyber.lsp')

-- https://github.com/sidebar-nvim/sidebar.nvim
local sidebar_opts = require('vyber.sidebar-nvim-opts')
require('sidebar-nvim').setup(sidebar_opts)
