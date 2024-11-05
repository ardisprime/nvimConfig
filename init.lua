
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

-- select plugins to install
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
-- select opts 
local opts = {
  
}

-- setup lazy 
require("lazy").setup(plugins, opts)
-- setup telescop
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {} )
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {} )
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









 















