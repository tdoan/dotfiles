-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.tmux_navigator_no_wrap = 1

vim.g.mapleader = "\\"
vim.g.localleader = "\\"
local vopt = vim.opt
vopt.colorcolumn = "80"    -- str:  Show col for max line length
vopt.number = true         -- bool: Show line numbers
vopt.relativenumber = true -- bool: Show relative line numbers
vopt.scrolloff = 4         -- int:  Min num lines of context
vopt.signcolumn = "yes"    -- str:  Show the sign column
vopt.encoding = "utf8"     -- str:  String encoding to use
vopt.fileencoding = "utf8" -- str:  File encoding to use
vopt.syntax = "ON"         -- str:  Allow syntax highlighting
vopt.synmaxcol = 160
vopt.termguicolors = true  -- bool: If term supports ui color then enable
vopt.ignorecase = true     -- bool: Ignore case in search patterns
vopt.smartcase = true      -- bool: Override ignorecase if search contains capitals
vopt.incsearch = true      -- bool: Use incremental search
vopt.hlsearch = true       -- bool: Highlight search matches
vopt.incsearch = true      -- bool: Highlight search matches
vopt.showmatch = true      -- bool: Highlight search matches
vopt.expandtab = true      -- bool: Use spaces instead of tabs
vopt.shiftwidth = 4        -- num:  Size of an indent
vopt.softtabstop = 4       -- num:  Number of spaces tabs count for in insert mode
vopt.tabstop = 4           -- num:  Number of spaces tabs count for
vopt.autoindent = true
vopt.splitright = true     -- bool: Place new window to right of current one
vopt.splitbelow = true
vopt.laststatus = 2
vopt.mouse = ""

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('i', 'jk', '<ESC>', opts)
keymap("n", "<leader><leader>", "<C-^>", opts)
keymap("n", "<leader><CR>", ":nohlsearch<cr>", opts)
keymap("n", "<S-h>", "^", opts)
keymap("n", "<S-l>", "$", opts)
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>=", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

keymap('n', "<leader>e", ':e <C-R>=expand("%:p:h") . "/" <CR>', opts)
keymap('n', "<leader>t", ':tabe <C-R>=expand("%:p:h") . "/" <CR>', opts)
keymap('n', "<leader>s", ':split <C-R>=expand("%:p:h") . "/" <CR>', opts)
keymap('n', "<leader>v", ':vsplit <C-R>=expand("%:p:h") . "/" <CR>', opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
