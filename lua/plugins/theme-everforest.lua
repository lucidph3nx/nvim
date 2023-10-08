return {
  'neanias/everforest-nvim',
  cond = function()
    if 'everforest_light' == vim.fn.system('cli.system.getColourScheme') then
      return true;
    end;
    if 'everforest_dark' == vim.fn.system('cli.system.getColourScheme') then
      return true;
    end;
    return false
  end,
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function(_, opts)
    require('everforest').setup(opts)
    if 'everforest_light' == vim.fn.system('cli.system.getColourScheme') then
      vim.o.background = 'light'
    end;
    if 'everforest_dark' == vim.fn.system('cli.system.getColourScheme') then
      vim.o.background = 'dark'
    end;
    require("everforest").load()
  end,
}
