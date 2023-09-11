-- best theme ever
return {
  'navarasu/onedark.nvim',
  cond = 'atom_one_dark' == vim.fn.system('cli.system.getColourScheme'),
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function(_, opts)
    require('onedark').setup(opts)
    require('onedark').load()
  end,
}
