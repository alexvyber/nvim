local M = {}

ExposedConfigFunctions = {}
-- Put the function into a global table to make it accessible everywhere,
-- so it can be used in keymaps, autocommands, etc.
local function expose_config_function(func, func_name)
	func_name = func_name:gsub("[^%w_]", "")
	ExposedConfigFunctions[func_name] = func
	return "ExposedConfigFunctions." .. func_name
end

-- Allow subscribing to config manipution events. It can be useful for
-- configuring plugins. For example 'which-key.nvim' can read keymap
-- descriptions this way.
local _callbacks = {
	options_registered = {},
	globals_registered = {},
	keymaps_registered = {},
	autocmds_registered = {},
	lsp_on_attach = {},
}
local function execute_callbacks(category, ...)
	for callback_name, callback_func in pairs(_callbacks[category]) do
		local success, error_msg = pcall(callback_func, ...)
		if not success then
			print(string.format("'%s' callback error (id: '%s'): %s", category, callback_name, error_msg))
		end
	end
end

-- =============================================================================
-- Registering callbacks
-- =============================================================================

function M.register_callbacks(callback_data)
	for callback_category, callbacks in pairs(callback_data) do
		for callback_name, callback_func in pairs(callbacks) do
			_callbacks[callback_category][callback_name] = callback_func
		end
	end
end

-- Hook into 'on_attach' method for every LSP client created, so plugins can
-- register their own callbacks separately.
vim.lsp.start_client_original = vim.lsp.start_client_original or vim.lsp.start_client
vim.lsp.start_client = function(config, ...)
	if config.on_attach then
		local on_attach_func = config.on_attach
		config.on_attach = function(...)
			on_attach_func(...)
			execute_callbacks("lsp_on_attach", ...)
		end
	else
		config.on_attach = function(...)
			execute_callbacks("lsp_on_attach", ...)
		end
	end
	return vim.lsp.start_client_original(config, ...)
end

-- =============================================================================
-- Registering various Neovim settings
-- =============================================================================

function M.register_options(options, bufnr)
	for key, value in pairs(options) do
		if bufnr then
			vim.api.nvim_buf_set_option(bufnr, key, value)
		else
			if type(value) == "function" then
				value = "v:lua." .. expose_config_function(value, "option_" .. key) .. "()"
			end
			-- vim.api.nvim_set_option(key, value)
			-- -- TODO: Get rid of this hack once https://github.com/neovim/neovim/issues/13433 is resolved
			-- pcall(vim.api.nvim_buf_set_option, 0, key, value)
			-- pcall(vim.api.nvim_win_set_option, 0, key, value)
			vim.opt[key] = value
		end
	end
	execute_callbacks("options_registered", options, bufnr)
end

function M.register_global_vars(global_vars)
	for key, value in pairs(global_vars) do
		vim.g[key] = value
	end
	execute_callbacks("globals_registered", global_vars)
end

local DEFAULT_KEYMAP_OPTIONS = { noremap = true, silent = true }
function M.register_keymaps(keymaps, bufnr)
	for keymap_name, keymap in pairs(keymaps) do
		if not keymap[4] then
			keymap[4] = DEFAULT_KEYMAP_OPTIONS
		end
		local keymap_command_type = type(keymap[3])
		if keymap_command_type ~= "string" then
			local keymap_command_func = (keymap_command_type == "table") and keymap[3][1] or keymap[3]
			local keymap_command_args = (keymap_command_type == "table") and keymap[3][2] or ""
			local exposed_func_name = expose_config_function(keymap_command_func, keymap_name)
			keymap[3] = string.format(
				keymap[4].expr and 'luaeval("%s(%s)")' or "<cmd>lua %s(%s)<CR>",
				exposed_func_name,
				keymap_command_args
			)
		end
		if bufnr then
			vim.api.nvim_buf_set_keymap(bufnr, unpack(keymap))
		else
			vim.api.nvim_set_keymap(unpack(keymap))
		end
	end
	execute_callbacks("keymaps_registered", keymaps, bufnr)
end

function M.register_autocmds(autocmds, current_buffer)
	for augroup_name, augroup in pairs(autocmds) do
		vim.api.nvim_command("augroup " .. augroup_name)
		vim.api.nvim_command("autocmd!" .. (current_buffer and " * <buffer>" or ""))
		for i, autocmd in ipairs(augroup) do
			local pattern = type(autocmd[2]) == "table" and table.concat(autocmd[2], ",") or autocmd[2]
			local cmd = type(autocmd[3]) == "function"
					and ("lua " .. expose_config_function(autocmd[3], augroup_name .. i) .. "()")
				or autocmd[3]
			vim.api.nvim_command("autocmd " .. table.concat({ autocmd[1], pattern, cmd }, " "))
		end
		vim.api.nvim_command("augroup END")
	end
	execute_callbacks("autocmds_registered", autocmds, current_buffer)
end

function M.register(settings, buffer_specific)
	for s_type, s_data in pairs(settings) do
		M["register_" .. s_type](s_data, buffer_specific)
	end
end

return M
