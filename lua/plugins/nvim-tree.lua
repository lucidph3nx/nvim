-- file browser that I really shouldnt use
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  cmd = "NvimTreeToggle",
  keys = {
    { '<leader>et', vim.cmd.NvimTreeToggle,   desc = '[E]xplorer [T]oggle' },
    { '<leader>ec', vim.cmd.NvimTreeCollapse, desc = '[E]xplorer [C]ollapse Folders' },
  },
  opts = {
    filters = {
      --disable the filtering out of dotfiles
      dotfiles = false
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = {},
    },
  },
  config = function(_, opts)
    require('nvim-tree').setup(opts)
  end,
}
