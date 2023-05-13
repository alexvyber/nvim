vim.g.loaded_matchparen = 1
local opt = vim.opt
vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

local options = {

  -- Ignore compiled files
  -- wildignore = "__pycache__"

  -- Cool floating window popup menu for completion on command line
  pumblend = 17,
  -- wildmode = "longest:full",
  -- wildons = "pum",

  -- showmode = false
  cmdheight = 5, -- Height of the command bar
  incsearch = true, -- Makes search act like search in modern browsers
  showmatch = true, -- show matching brackets when text indicator is over them
  ignorecase = true, -- Ignore case when searching...
  smartcase = true, -- ... unless there is a capital letter in the query
  hidden = true, -- I like having buffers stay around
  equalalways = false, -- I don't like my windows changing all the time
  splitright = true, -- Prefer windows splitting to the right
  splitbelow = true, -- Prefer windows splitting to the bottom
  updatetime = 1000, -- Make updates happen faster
  hlsearch = true, -- I wouldn't use this without my DoNoHL function
  scrolloff = 10, -- Make it so there are always ten lines below my cursor

  -- Cursorline highlighting control
  --  Only have it on in the active buffer
  -- cursorline = true -- Highlight the current line
  -- local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
  -- local set_cursorline = function(event, value, pattern)
  --   vim.api.nvim_create_autocmd(event, {
  --     group = group,
  --     pattern = pattern,
  --     callback = function()
  --       vim.local.cursorline = value
  --     end,
  --   })
  -- end
  -- set_cursorline("WinLeave", false)
  -- set_cursorline("WinEnter", true)
  -- set_cursorline("FileType", false, "TelescopePrompt")

  -- Tabs
  autoindent = true,
  cindent = true,

  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,

  breakindent = true,
  showbreak = string.rep(" ", 3), -- Make it so that long lines wrap smartly
  linebreak = true,

  foldmethod = "marker",
  foldlevel = 0,
  modelines = 1,

  belloff = "all", -- Just turn the dang bell off

  -- clipboard = "unnamedplus"

  inccommand = "split",
  shada = { "!", "'1000", "<50", "s10", "h" },

  mouse = "n",

  -- Helpful related items:
  --   1. :center, :left, :right
  --   2. gw{motion} - Put cursor back after formatting motion.
  --
  -- TODO: w, {v, b, l}
  -- formatons = formatons
  --   - "a" -- Auto formatting is BAD.
  --   - "t" -- Don't auto format my code. I got linters for that.
  --   + "c" -- In general, I like it when comments respect textwidth
  --   + "q" -- Allow formatting comments w/ gq
  --   - "o" -- O and o, don't continue comments
  --   + "r" -- But do continue when pressing enter.
  --   + "n" -- Indent past the formatlistpat, not underneath it.
  --   + "j" -- Auto-remove comments if possible.
  --   - "2", -- I'm not in gradeschool anymore

  -- set joinspaces
  joinspaces = false, -- Two spaces and grade school, we're done

  ------------------------------------------------------------------------------
  -- SEARCH AND PATTERNS
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns ...
  smartcase = true, -- ... unless it contains a capital letter
  incsearch = true, -- search while typing (don't wait for <CR>)
  magic = true, -- magic patterns by default, where e.g.:
  -- .      any character
  -- $      end of line
  -- *      any Number of prev atom
  -- see: https://neovim.io/doc/user/pattern.html#pattern

  -- FILE MANAGEMENT
  -- backup = false, -- creates a backup file
  -- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- swapfile = false, -- creates a swapfile

  -- OTHER
  -- clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showtabline = 2, -- always show tabs
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  numberwidth = 3, -- set number column width to 2 {default 3}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- long text wraps to next line. Annoying, but the alternative of auto horizontal scrolling is worse
  scrolloff = 8, -- window will scroll to prevent cursor from coming within X rows of top or bottom
  sidescrolloff = 8, -- ditto, but for horizonal scrolling..
  guifont = "monospace:h17", -- the font used in graphical neovim applications

  -- Visible line numbers.
  -- TODO: git rid of relativenumber, and fix current line number highlighting
  number = true,
  relativenumber = true,
  -- Make gutter dynamically change its size to up to 4 columns.
  signcolumn = "auto:4",
  -- Get rid of '-- INSERT --' in command line.
  -- showmode = false,
  -- Add 24-bit color support.
  termguicolors = true,
  -- Replace default interface characters.
  fillchars = {
    -- Window separator
    vert = "█",
    -- Fold marker
    fold = ">",
    -- Deleted code area filler
    diff = "╱",
    eob = "=",
  },
  -- fillchars = { eob = "+" },
  -- Use system clipboard.
  clipboard = "unnamedplus",
  -- Indentation is 2 spaces.
  shiftwidth = 2,
  -- Automatically convert Tab to spaces.
  expandtab = true,
  -- Snap code to indentation grid when shifting it with < and >.
  shiftround = true,
  -- Indent wrapped lines with the same amount of space as the beginning of the original line.
  breakindent = false,
  -- Additionally, indent it with this sequence:
  -- showbreak = ' └ ',
  -- Instead of breaking wrapped lines at the last character that fit window, use one of the chars defined in 'breakat'.
  linebreak = false,
  -- breakat = ' -+*/=;,()[]{}',
  -- TODO: I think I put it in there as a test, and it's actually set in indent-blankline plugin settings.
  list = true,
  -- Automatically reload files when they get modified.
  autoread = true,
  -- Things to save in a persistent session.
  sessionoptions = {
    "buffers",
    "curdir",
    "folds",
    "help",
    "tabpages",
    "winsize",
  },
  -- The minimal distance to keep between editor sides and the cursor while scrolling.
  scrolloff = 8,
  sidescrolloff = 8,
  -- Splitting window vertacally / horizontaly puts new window on the right / below.
  splitright = true,
  splitbelow = true,
  -- Timeout for triggering 'CursorHold' event (default 4000ms). Also something about swap file.
  updatetime = 100,
  -- Timeout for when a keymap sequence is considered completed.
  timeoutlen = 500,
  -- When inserting a bracket, highlight matching one.
  showmatch = true,
  matchtime = 3,
  -- Ignore letter case while searching. Precise case matching can be forced with '\C'.
  ignorecase = true,
  -- :%s (search and replace) preview.
  inccommand = "split",
  -- Open files with all folds opened by default.
  foldenable = false,
  -- Use my own function for fold preview formatting.
  foldtext = foldtext_formatting,
  -- Ignore case while explaning wildcards.
  wildignorecase = true,
  -- Ignored patterns while expanding wildcards.
  wildignore = table.concat({
    "*.git*",
    "*node_modules*",
    "*pycache*",
  }, ","),

  -- Lower priority files while expanding wildcards.
  suffixes = table.concat({
    ".o",
    ".so",
    ".obj",
    ".dll",
    ".exe",
    ".jar",
    ".log",
    ".class",
    ".swp",
  }, ","),
}

-- Set Options
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[ set whichwrap+=<,>,[,],h,l ]] -- aa
vim.cmd [[ set iskeyword+=-           ]]
vim.cmd [[ set formatoptions-=cro     ]] -- TODO: this doesn't seem to work

-- Remove trailing whitespace on write
vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]
vim.cmd [[ set fillchars+=eob:\ ]]
