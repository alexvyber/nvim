local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local n = function(lhs, rhs)
	vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end
local v = function(lhs, rhs)
	vim.api.nvim_set_keymap('v', lhs, rhs, opts)
end
local x = function(lhs, rhs)
	vim.api.nvim_set_keymap('x', lhs, rhs, opts)
end
local t = function(lhs, rhs)
	vim.api.nvim_set_keymap('t', lhs, rhs, term_opts)
end

vim.g.mapleader = "#"
-- vim.keymap.set("n", "<Space>w", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end)
vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)

-- tip: to see currrent keybindings:
-- :nmap
vim.api.nvim_set_keymap('', '#', '<Nop>', opts)


KEYMAPS = {
	['Open Nvim-Tree'] = { 'n', '<leader>=', ':NvimTreeToggle<cr>' },
	['EOL append with autoindent'] = { 'n', 'A', autoindent_on_eol_append, { expr = true } },
	['New buffer'] = { 'n', '<leader>bn', ':enew<CR>' },
	['Split window'] = { 'n', '<leader>ws', ':split<CR>' },
	['Vertically split window'] = { 'n', '<leader>wv', ':vsplit<CR>' },
	['Close current window'] = { 'n', '<leader>x', ':close<cr><c-w><c-p>' },
	['Switch to latest buffer'] = { 'n', '<tab>', switch_to_latest_buffer },
	['Switch focus to left window'] = { 'n', '<c-h>', '<c-w>h' },
	['Switch focus to bottom window'] = { 'n', '<c-j>', '<c-w>j' },
	['Switch focus to top window'] = { 'n', '<c-k>', '<c-w>k' },
	['Switch focus to right window'] = { 'n', '<c-l>', '<c-w>l' },
	perform_semantic_movement_forward = { 'i', '<tab>', semantic_movement },
	perform_semantic_movement_backward = { 'i', '<s-tab>', { semantic_movement, 'true' } },
}

-- for i = 1, 9 do
--	n('<A-' .. i .. '>', ':tabn ' .. i .. '<cr>')
-- end

n('<leader>tc', ':tabclose<CR>') -- Close tab
n('<leader>tn', ':tabsplit<CR>') -- New tab


n('<C-n>', ':nohlsearch<CR>') -- Disable search highlights
n('<tab>', 'g<tab>') -- Switch to latest tab


n('<a-k>', ':m .-2<CR>==') -- Move current line up
n('<a-j>', ':m .+1<CR>==') -- Move current line down


-- Better window navigation
n('<C-h>', '<C-w>h') -- focus window left
n('<C-l>', '<C-w>l') -- focus window right
n('<C-k>', '<C-w>k') -- focus window up
n('<C-j>', '<C-w>j') -- focus window down


-- Navigate buffers
n('<S-l>', ':bnext<CR>') -- next buffer
n('<S-h>', ':bprevious<CR>') -- prev buffer

---------------------------------------
-- Visual
---------------------------------------

-- Stay in indent mode
v('<', '<gv')
v('>', '>gv')

-- Move text up and down
v('<A-j>', ':m .+1<CR>==')
v('<A-k>', ':m .-2<CR>==')

v('p', '_dP') -- Paste to selection without yanking
v('<a-k>', ":m '<-2<CR>gv=gv") -- Move selected lines up
v('<a-j', ":m '>+1<CR>gv=gv") -- Move selected lines down

-- Search and Replace

-- Here are the steps to do a multi-file search and replace
-- (from Practical Vim, p.239)
-- /Pragmatic\ze Vim
-- :vimgrep // **/*.txt
-- :cfdo %s//Practical/gc | update

-- :cn goes to the next result
-- See the quickfix window
-- https://thevaluable.dev/vim-search-find-replace/
-- https://blog.jasonmeridth.com/posts/use-git-grep-to-replace-strings-in-files-in-your-git-repository/
-- https://superuser.com/questions/400078/how-can-i-search-a-file-by-its-name-and-partial-path

-- Search for visually selected text
-- note: I don't know why I need to include a backspace... but otherwise the following character get searched as well
-- v("//", [[ y/\V<C-R>"<BS><CR> ]])                   -- search current page
-- v("/a", [[ y/<C-R>"<BS><CR>:AckFromSearch<CR> ]])  -- search cwd


---------------------------------------
-- Visual Block
---------------------------------------


-- Move text up and down
-- x("J",      ":move '>+1<CR>gv-gv")
-- x("K",      ":move '<-2<CR>gv-gv")
-- x("<A-j>",  ":move '>+1<CR>gv-gv")
-- x("<A-k>",  ":move '<-2<CR>gv-gv")


---------------------------------------
-- Plugins
---------------------------------------


-- Telescope
n('<space>f', ':Telescope find_files<CR>')
n('<space>t', ':Telescope live_grep<CR>')


-- Nvimtree
n('<space>e', ':NvimTreeToggle<CR>')
n('<space>w', ':NvimTreeFocus<CR>') -- Focus Nvim-Tree


-- LSP
-- (see /lsp/handlers)
