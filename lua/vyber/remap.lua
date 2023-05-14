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

--[[ vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end) ]]
--[[ vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end) ]]

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
	--[[ ['Switch focus to left window'] = { 'n', '<c-h>', '<c-w>h' }, ]]
	--[[ ['Switch focus to bottom window'] = { 'n', '<c-j>', '<c-w>j' }, ]]
	--[[ ['Switch focus to top window'] = { 'n', '<c-k>', '<c-w>k' }, ]]
	--[[ ['Switch focus to right window'] = { 'n', '<c-l>', '<c-w>l' }, ]]
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
n('<C-]>', ':bnext<CR>') -- next buffer
n('<C-[>', ':bprevious<CR>') -- prev buffer

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
--
--
--
--
--
--
--
--




-- " map n  <Plug>(incsearch-nohl-n)
-- " map N  <Plug>(incsearch-nohl-N)
-- map <PageUp> <Plug>(incsearch-nohl-#)
-- map <PageDown>  <Plug>(incsearch-nohl-*)
-- map g* <Plug>(incsearch-nohl-g*)
-- map g# <Plug>(incsearch-nohl-g#)
--
-- " Tab completion for asyncomplete
-- " TODO what is it?
-- " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- " inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
--
-- " nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
-- nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
--
-- " Perform fuzzy file searching
-- nnoremap <C-P> mN:Files<cr>
-- nnoremap <C-B> mN:Buffers<CR>
-- nnoremap <space>/ mN:Lines<cr>
-- nnoremap <leader><leader> mN:Commands<cr>
-- nnoremap <leader>/ mN:History/<cr>
-- nnoremap <leader>: mN:History:<cr>
-- nnoremap <leader>? mN:Helptags<cr>
--
-- " Hightlight all incremental search results
-- " map /  <plug>(incsearch-forward)
-- " map ?  <plug>(incsearch-backward)
-- " map g/ <plug>(incsearch-stay)
--
-- " Set up some handy CtrlSF bindings
-- nmap <leader>a :CtrlSF -R ""<Left>
-- nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
-- nmap <leader>c :CtrlSFFocus<CR>
-- nmap <leader>C :CtrlSFToggle<CR>
--
-- nnoremap <leader>y "+y
-- vnoremap <leader>y "+y
--
-- nnoremap <leader>o o<CR>
-- nnoremap <leader><leader>o o<CR><Esc>O
-- nnoremap <leader>go Go<CR>
-- nnoremap <leader>gp Gp
--
-- " Remap from VIM book... TODO make ref to book or find plugin with analogus
-- " fumctinonality
-- inoremap <leader>' <Esc>bi'<Esc>ea'
-- inoremap <leader><leader>' <Esc>bi"<Esc>ea"
--
-- inoremap <leader>: <Esc>kA:<Esc>jA
--
-- " Take user input Open full-screen help on the new tab
-- nnoremap <space>h :tab h <C-R>=<CR>
--
-- nnoremap <leader>e :ALEDetail<cr> " Show errors on leader-e
--
-- "" Switching windows
-- noremap <C-j> <C-w>j
-- noremap <C-k> <C-w>k
-- noremap <C-l> <C-w>l
-- noremap <C-h> <C-w>h
--
-- " Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
-- nnoremap <silent><leader><leader><del> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><leader><del> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <leader><space> :set paste<CR>m`o<Esc>``:set nopaste<CR>
-- nnoremap <leader><leader><space> :set paste<CR>m`O<Esc>``:set nopaste<CR>
--
-- "" Move visual block
-- vnoremap K :m '<-2<CR>gv=gv
-- vnoremap J :m '>+1<CR>gv=gv
--
-- " Paste over the word https://stackoverflow.com/a/7797434
-- xnoremap p pgvy
--
-- "" Open current line on GitHub
-- " nnoremap <Leader>o :.Gbrowse<CR>
--
--
-- " Search mappings: These will make it so that going to the next one in a
-- " search will center on the line it's found in.
-- nnoremap n nzzzv
-- nnoremap N Nzzzv
--
-- "" Split
-- noremap <Leader>v :<C-u>vsplit<CR>
--
-- "" Clean search (highlight)
-- nnoremap <silent> <space>n :noh<cr>
--
-- "" Git
-- noremap <Leader>ga :Gwrite<CR>
-- noremap <Leader>gc :Git commit --verbose<CR>
-- noremap <Leader>gsh :Git push<CR>
-- noremap <Leader>gll :Git pull<CR>
-- noremap <Leader>gs :Git<CR>
-- noremap <Leader>gb :Git blame<CR>
-- noremap <Leader>gd :Gvdiffsplit<CR>
-- noremap <Leader>gr :GRemove<CR>
--
-- "" Vmap for maintain Visual Mode after shifting > and <
-- vmap < <gv
-- vmap > >gv
--
-- " Tagbar
-- nmap <silent> <F4> :TagbarToggle<CR>
-- let g:tagbar_autofocus = 1
--
-- "" Buffer nav
-- noremap <leader>q :bp<CR>
-- noremap <leader>w :bn<CR>
--
-- "" Close buffer
-- noremap <leader>c :bd<CR>
--
-- noremap YY "+y<CR>
-- noremap <leader>p "+gP<CR>
--
-- "" Set working directory
-- nnoremap <leader>. :lcd %:p:h<CR>
--
-- "" Opens an edit command with the path of the currently edited file filled in
-- noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
--
-- "" Opens a tab edit command with the path of the currently edited file filled
-- noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
-- noremap XX "+x<CR>
--
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> gr <Plug>(coc-references)
-- " ··············································································
-- " session management
-- nnoremap <leader>so :OpenSession<Space>
-- nnoremap <leader>ss :SaveSession<Space>
-- nnoremap <leader>sd :DeleteSession<CR>
-- nnoremap <leader>sc :CloseSession<CR>
--
-- " ··············································································
-- "  Tabs
--
-- nnoremap <Tab> gt
-- nnoremap <S-Tab> gT
-- nnoremap <silent> <S-t> :tabnew<CR>
--
-- nnoremap <BS> gt
-- nnoremap = gT
--
-- " Expand all opend files into tabs
-- nnoremap <leader><tab> :tab all<CR>
--
-- " The Silver Searcher
-- if executable('ag')
  -- let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  -- set grepprg=ag\ --nogroup\ --nocolor
-- endif
--
-- " ripgrep
-- if executable('rg')
  -- let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  -- set grepprg=rg\ --vimgrep
  -- command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
-- endif
--
-- cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
-- nnoremap <silent> <leader>b :Buffers<CR>
-- nnoremap <silent> <leader>e :FZF -m<CR>
--
-- "Recovery commands from history through FZF
-- nmap <leader>y :History<CR>
--
-- " Next/Prev error bindings for Ale
-- nmap <silent> <C-k> <Plug>(ale_previous_wrap)
-- nmap <silent> <C-j> <Plug>(ale_next_wrap)
--
-- " ··············································································
-- "  Service Mappings
-- nnoremap <leader><CR> :so ~/.vimrc<CR>
-- nnoremap <leader><leader>e :tabe ~/.vimrc<CR>
-- nnoremap <leader><leader><leader> :set list<CR>
-- nnoremap <leader><leader><leader><leader> :echo "leader:" mapleader<CR>
--
-- nnoremap #5 S" ··············································································<Esc>
--
--
-- " LuaSnip
-- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- " -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
--
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
--
-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
--
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
--
--
-- noremap <space>jj k_Dj$p
