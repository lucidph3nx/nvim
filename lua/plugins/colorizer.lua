-- plugin to show hex colours etc inline
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    -- seems weird but it works...
    -- doesnt have great config for lazy.nvim yet
    require('colorizer').setup(nil, {
      -- don't colorize names
      names = false
    })
  end,
}
