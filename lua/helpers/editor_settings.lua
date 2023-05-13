
-- -----------------------------------------------------------------------------
-- For autocmds
-- -----------------------------------------------------------------------------

-- Restores latest cursor position in previously closed file.
local function restore_cursor_position()
	local last_cursor_position = vim.api.nvim_buf_get_mark(0, '"')
	local buffer_line_count = vim.api.nvim_buf_line_count(0)
	if last_cursor_position[1] <= buffer_line_count then
		vim.api.nvim_win_set_cursor(0, last_cursor_position)
	end
end

-- -----------------------------------------------------------------------------
-- For keymaps
-- -----------------------------------------------------------------------------

local function autoindent_on_eol_append()
	if string.len(vim.api.nvim_get_current_line()) == 0 then
		-- Throw copied string into abyss ('_' register), so 'cc' won't mess with default registers.
		return '"_cc'
	else
		return "A"
	end
end

-- TODO: don't perform semantic movement if it's an empty string; indentate instead
local function semantic_movement(backwards)
	local next_match_position = vim.api.nvim_call_function(
		"searchpos",
		{ "\\S\\@<=\\s\\|\\W\\@<=\\w\\|[^A-Za-z0-9_ ]\\|$", "Wn" .. (backwards and "b" or "") }
	)
	local current_line_number = vim.api.nvim_win_get_cursor(0)[1]
	local no_match_found = next_match_position[1] == 0 and next_match_position[2] == 0
	local new_cursor_position
	if no_match_found or (next_match_position[1] ~= current_line_number) then
		new_cursor_position = { current_line_number, backwards and 0 or string.len(vim.api.nvim_get_current_line()) }
	else
		-- Current line position in `nvim_win_set_cursor` starts from 0 instead of 1.
		new_cursor_position = { next_match_position[1], next_match_position[2] - 1 }
	end
	vim.api.nvim_win_set_cursor(0, new_cursor_position)
end

-- local function switch_to_latest_buffer()
--   pcall(vim.api.nvim_set_current_buf, vim.fn.bufnr('#'))
-- end

local function close_current_buffer()
	local previous_bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_command("bprevious")
	vim.api.nvim_buf_delete((previous_bufnr == vim.api.nvim_get_current_buf()) and 0 or previous_bufnr, {})
end

local _buffer_width_cached
local function foldtext_formatting()
	-- local buffer_width = vim.api.nvim_win_get_width(0) - (vim.fn.wincol() - vim.fn.virtcol('.'))
	local buffer_width = vim.api.nvim_win_get_width(0) - _buffer_width_cached
	local fold_line_count_label = " " .. (vim.v.foldend - vim.v.foldstart + 1) .. " lines "
	local fold_preview_max_width = buffer_width - string.len(fold_line_count_label)
	local fold_preview = vim.fn.getline(vim.v.foldstart)
	-- Folds display tab indents incorrectly. Replace it with spaces.
	fold_preview = string.gsub(fold_preview, "\t", string.rep(" ", vim.api.nvim_buf_get_option(0, "tabstop")))
	-- Test; bad for python; bad for langs where brackets are on the 2nd string
	fold_preview = fold_preview .. " … " .. vim.fn.trim(vim.fn.getline(vim.v.foldend))

	if string.len(fold_preview) > fold_preview_max_width then
		fold_preview = string.sub(fold_preview, 1, fold_preview_max_width - 1) .. "…"
	end
	return fold_preview
		.. string.rep(" ", buffer_width - string.len(fold_preview) - string.len(fold_line_count_label))
		.. fold_line_count_label
end

return {

	OPTIONS = {
		-- -- Visible line numbers.
		-- -- TODO: git rid of relativenumber, and fix current line number highlighting
		-- number = true,
		-- relativenumber = true,
		-- -- Make gutter dynamically change its size to up to 4 columns.
		-- signcolumn = "auto:4",
		-- -- Get rid of '-- INSERT --' in command line.
		-- -- showmode = false,
		-- -- Add 24-bit color support.
		-- termguicolors = true,
		-- -- Replace default interface characters.
		-- fillchars = {
		-- 	-- Window separator
		-- 	vert = "█",
		-- 	-- Fold marker
		-- 	fold = " ",
		-- 	-- Deleted code area filler
		-- 	diff = "╱",
		-- },
		-- -- Use system clipboard.
		-- clipboard = "unnamedplus",
		-- -- Render tab as 2 spaces.
		-- tabstop = 2,
		-- -- Indentation is 2 spaces.
		-- shiftwidth = 2,
		-- -- Automatically convert Tab to spaces.
		-- expandtab = true,
		-- -- Snap code to indentation grid when shifting it with < and >.
		-- shiftround = true,
		-- -- Indent wrapped lines with the same amount of space as the beginning of the original line.
		-- breakindent = true,
		-- -- Additionally, indent it with this sequence:
		-- showbreak = " └ ",
		-- -- Instead of breaking wrapped lines at the last character that fit window, use one of the chars defined in 'breakat'.
		-- linebreak = true,
		-- breakat = " -+*/=;,()[]{}",
		-- -- TODO: I think I put it in there as a test, and it's actually set in indent-blankline plugin settings.
		-- list = true,
		-- -- Automatically reload files when they get modified.
		-- autoread = true,
		-- -- Things to save in a persistent session.
		-- sessionoptions = {
		-- 	"buffers",
		-- 	"curdir",
		-- 	"folds",
		-- 	"help",
		-- 	"tabpages",
		-- 	"winsize",
		-- },
		-- -- The minimal distance to keep between editor sides and the cursor while scrolling.
		-- scrolloff = 8,
		-- sidescrolloff = 8,
		-- -- Splitting window vertacally / horizontaly puts new window on the right / below.
		-- splitright = true,
		-- splitbelow = true,
		-- -- Timeout for triggering 'CursorHold' event (default 4000ms). Also something about swap file.
		-- updatetime = 100,
		-- -- Timeout for when a keymap sequence is considered completed.
		-- timeoutlen = 500,
		-- -- When inserting a bracket, highlight matching one.
		-- showmatch = true,
		-- matchtime = 3,
		-- -- Ignore letter case while searching. Precise case matching can be forced with '\C'.
		-- ignorecase = true,
		-- -- :%s (search and replace) preview.
		-- inccommand = "split",
		-- -- Open files with all folds opened by default.
		-- foldenable = false,
		-- -- Use my own function for fold preview formatting.
		-- foldtext = foldtext_formatting,
		-- -- Ignore case while explaning wildcards.
		-- wildignorecase = true,
		-- -- Ignored patterns while expanding wildcards.
		-- wildignore = table.concat({
		-- 	"*/.git/*",
		-- 	"*/node_modules/*",
		-- 	"*/__pycache__/*",
		-- }, ","),
		-- -- Lower priority files while expanding wildcards.
		-- suffixes = table.concat({
		-- 	".o",
		-- 	".so",
		-- 	".obj",
		-- 	".dll",
		-- 	".exe",
		-- 	".jar",
		-- 	".log",
		-- 	".class",
		-- 	".swp",
		-- }, ","),
	},

	GLOBAL_VARS = {
		mapleader = "#",
	},

	KEYMAPS = {
		["EOL append with autoindent"] = { "n", "A", autoindent_on_eol_append, { expr = true } },
		["Close buffer"] = { "n", "<leader>bc", close_current_buffer },
		perform_semantic_movement_forward = { "i", "<tab>", semantic_movement },
		perform_semantic_movement_backward = { "i", "<s-tab>", { semantic_movement, "true" } },
	},

	AUTOCMDS = {
		highlight_yanked_text = {
			{ "TextYankPost", "*", "silent! lua vim.highlight.on_yank({timeout = 250})" },
		},
		set_cursor_to_latest_position = {
			{ "BufReadPost", "*", restore_cursor_position },
		},
		-- This setting cannot be set directly, because it gets overwritten every time a buffer
		-- with corresponding ftplugin is loaded: https://vi.stackexchange.com/a/19010
		disable_autocomments_when_pressing_o = {
			{ "BufEnter", "*", "set formatoptions-=o" },
		},
		dirty_hack_for_folds = {
			{
				"CursorMoved",
				"*",
				function()
					if not (vim.fn.foldclosed(vim.api.nvim_win_get_cursor(0)[1]) > 0) then
						_buffer_width_cached = (vim.fn.wincol() - vim.fn.virtcol("."))
					end
				end,
			},
		},
		-- TODO: move to packer config
		-- autocompile_packer_configs = {
		--   {'BufWritePost', 'plugins.lua', 'PackerCompile'},
		--   {'BufWritePost', 'plugin_configs.lua', 'PackerCompile'},
		-- },
	},
}
