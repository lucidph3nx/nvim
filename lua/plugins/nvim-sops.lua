return {
  'lucidph3nx/nvim-sops',
  event = { 'BufEnter' },
  keys = {
    { '<leader>ef', vim.cmd.SopsEncrypt, desc = '[E]ncrypt [F]ile' },
    { '<leader>df', vim.cmd.SopsDecrypt, desc = '[D]ecrypt [F]ile' },
  },
  opts = {
    enabled = true,
    debug = true,
  },
}
