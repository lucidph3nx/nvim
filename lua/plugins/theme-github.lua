return {
  'projekt0n/github-nvim-theme',
  cond = 'github_light' == vim.fn.system('cli.system.getColourScheme'),
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function(_, opts)
    require('github-theme').setup(opts)
    vim.cmd('colorscheme github_light')
  end,
}
