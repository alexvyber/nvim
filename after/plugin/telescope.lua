local builtin = require "telescope.builtin"
vim.keymap.set("n", "<Space>f", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<Space>s", function()
  builtin.grep_string { search = vim.fn.input "Grep > " }
end)
