Resources = {}

function Colorize(color)
  color = color or "catppuccin"
  --[[ color = color or "rose-pine" ]]
  vim.cmd.colorscheme(color)

  vim.cmd [[ highlight ColorColumn guibg=#f0f7fe ]]

  -- show colorcolumn at 81+ characters
  function getRange()
    str = ""
    for i = 81, 300 do
      str = str .. i .. ","
    end
    return str .. "301"
  end

  vim.api.nvim_set_option_value("colorcolumn", getRange(), {})
end

Resources.Colorize = Colorize

return Resources
