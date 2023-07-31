-- plugin to automatically close brackets etc
return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {},
  config = function()
    require('nvim-autopairs').setup()
    -- don't close quotes
    require('nvim-autopairs').remove_rule('"')
  end,
}
