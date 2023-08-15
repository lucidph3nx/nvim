return {
  'mhartington/formatter.nvim',
  config = function()
    local prettier = {
      function()
        return {
          exe = "./node_modules/.bin/prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
          try_node_modules = true,
        }
      end,
    }
    require("formatter").setup({
      logging = false,
      filetype = {
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        css = prettier,
        ['*'] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      },
    })
  end
}
