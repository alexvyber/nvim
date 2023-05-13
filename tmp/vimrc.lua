local M = {}

local VIMRC = require("helpers.read_file")

local function setup(settings)
	base_path = "/home/alexs/.config/nvim/"
	for _, setting in pairs(settings) do
		vim.cmd(VIMRC.take(base_path .. setting .. ".vim"))
	end
end

M.setup = setup

return M
