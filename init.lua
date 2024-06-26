-- My Neovim configuration

-- load keymaps
require('keymaps')
-- load general vim options
require('options')
-- load abbreviations
require('abbreviations')

-- Bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require('lazy').setup('plugins')

-- set up autocmds
require('autocmd')
