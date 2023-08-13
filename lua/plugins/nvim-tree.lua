-- file browser that I really shouldnt use

-- for floating tree
local HEIGHT_RATIO = 0.5
local WIDTH_RATIO = 0.5

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  cmd = "NvimTreeToggle",
  keys = {
    { '<leader>et', vim.cmd.NvimTreeToggle,   desc = '[E]xplorer [T]oggle' },
    { '<leader>ec', vim.cmd.NvimTreeCollapse, desc = '[E]xplorer [C]ollapse Folders' },
  },
  opts = {
    filters = {
      --disable the filtering out of dotfiles
      dotfiles = false
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = {},
    },
    view = {
      width = 50,
    }
    -- testing floating tree
    -- view = {
    --   relativenumber = true,
    --   float = {
    --     enable = true,
    --     open_win_config = function()
    --       local screen_w = vim.opt.columns:get()
    --       local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    --       local window_w = screen_w * WIDTH_RATIO
    --       local window_h = screen_h * HEIGHT_RATIO
    --       local window_w_int = math.floor(window_w)
    --       local window_h_int = math.floor(window_h)
    --       local center_x = (screen_w - window_w) / 2
    --       local center_y = ((vim.opt.lines:get() - window_h) / 2)
    --           - vim.opt.cmdheight:get()
    --       return {
    --         style = "minimal",
    --         -- border = "rounded",
    --         relative = "editor",
    --         row = center_y,
    --         col = center_x,
    --         width = window_w_int,
    --         height = window_h_int,
    --       }
    --     end,
    --   },
    --   width = function()
    --     return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    --   end,
    -- },
  },
  config = function(_, opts)
    require('nvim-tree').setup(opts)
  end,
}
