
-- setting indent
vim.cmd[[
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=0
]]

-- set relative lines
vim.cmd("set relativenumber")
-- disable line wrap
vim.cmd("set nowrap")
-- set leader to space
vim.g.mapleader = " "

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- select opts 
local opts = { }

-- setup lazy 
require("lazy").setup("plugins")
-- setup telescop
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {} )
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {} )
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")

vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal right<CR>")

vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
-- setup catppuccin 
require("catppuccin").setup()
-- setup treesitter 
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua"},
  highlight = {enable = true},
  indent = {enable = true},
})

-- set color scheme
vim.cmd.colorscheme "catppuccin-mocha"









 















