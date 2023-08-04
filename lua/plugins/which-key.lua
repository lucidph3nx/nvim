return {
  'folke/which-key.nvim',
  init = function()
    vim.o.timeout = true
    -- longer timeout, because i feel it shows to often
    vim.o.timeoutlen = 1000
  end,
  opts = {}
}
