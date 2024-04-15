return {
  'stevearc/oil.nvim',
  keys = {
    { '-', "<Cmd>Oil<CR>", desc = "open parent directory" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
