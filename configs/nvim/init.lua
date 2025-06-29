vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "


-- Bootstrap lazy.nvim jfklajasdjl:
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
--require("lazy").setup({
  --spec = {
    -- add your plugins here
 -- },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  --install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
   --checker = { enabled = true },
--})


----------------------

local opts = {}

require("lazy").setup("plugins")
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

 -- telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>', builtin.find_files, {})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {})

-- treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua","python","c","html","rust","go","haskell","r","java"},
  highlight = { enable = true }, 
  indent = { enable = true},
})

-- Neotree

vim.keymap.set('n','<C-b>',':Neotree filesystem reveal left<CR>',{})

