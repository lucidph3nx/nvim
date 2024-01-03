return {
  '3rd/image.nvim',
  opts = {
    backend = "kitty",
    -- window_overlap_clear_enabled = true,
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki" },
      },
      kitty_method = "normal",
    },
  },
  config = function(_, opts)
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"
    require('image').setup(opts)
  end,
}
