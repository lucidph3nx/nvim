return {
  'neanias/everforest-nvim',
  cond = 'everforest_dark' == vim.fn.system('cli.system.getColourScheme'),
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function(_, opts)
    require('everforest').setup(opts)
    require("everforest").load()
  end,
}
