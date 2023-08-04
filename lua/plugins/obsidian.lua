return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  event = { 'BufReadPre ' .. vim.fn.expand '~' .. '/documents/obsidian/**.md' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    dir = '~/documents/obsidian/personal-vault',
    nodes_subdir = 'notes',
    daily_notes = {
      folder = 'dailies',
    },
    completion = {
      nvim_cmp = true,
      new_notes_location = 'notes_subdir',
    },
    disable_frontmatter = true,
    mappings = {},
  },
}
