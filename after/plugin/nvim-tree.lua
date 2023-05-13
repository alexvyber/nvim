-- https://github.com/kyazdani42/nvim-tree.lua

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify "nvim-tree setup failed"
  return
end

local config_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local function actions()
  return {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  }
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
--  open_on_setup = false,
 --  ignore_ft_on_setup = {
    -- "startify",
 --    "dashboard",
 --    "alpha",
 --  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  actions = actions(),
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    --[[ height = 230, ]]
    hide_root_folder = false,
    side = "right",
    -- auto_resize = true,
--    mappings = {
 --      custom_only = false,
   --    list = {
     --    { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        -- { key = "h", cb = tree_cb "close_node" },
 --        { key = "v", cb = tree_cb "vsplit" },
    --   },
   --  },
    number = true,
    relativenumber = true,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    }
  }
}

