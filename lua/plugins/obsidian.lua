return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  event = { 'BufReadPre ' .. vim.fn.expand '~' .. '/documents/obsidian/**.md' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>od', vim.cmd.ObsidianToday,     desc = '[O]bsidian [D]aily note for Today' },
    { '<leader>oy', vim.cmd.ObsidianYesterday, desc = '[O]bsidian [Y]esterday' },
    { '<leader>oo', vim.cmd.ObsidianOpen,      desc = '[O]bsidian [O]pen' },
    { '<leader>ot', vim.cmd.ObsidianTemplate,  desc = '[O]bsidian [T]emplate' },
    { '<leader>on', vim.cmd.ObsidianNew,  desc = '[O]bsidian [N]ew' },
  },
  opts = {
    dir = '~/documents/obsidian/personal-vault',
    notes_subdir = 'notes',
    daily_notes = {
      folder = 'dailies',
      date_format = '%Y-%m-%d',
    },
    templates = {
      subdir = 'templates',
    },
    completion = {
      nvim_cmp = true,
      new_notes_location = 'notes_subdir',
    },
    disable_frontmatter = true,
    mappings = {},
  },
  config = function(_, opts)
    require('obsidian').setup(opts)
    -- autocmds
    local augroup = vim.api.nvim_create_augroup('lucidph3nx_obsidian', {})
    vim.api.nvim_create_autocmd('BufEnter', {
      group = augroup,
      pattern = '*.md',
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local buffer_content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)
        -- Check if the buffer content matches the default line format
        if #buffer_content > 0 and buffer_content[1]:match('^# %w+ %d+, %d+$') then
          -- Delete the default line
          vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
          -- Run ObsidianTemplate command
          vim.cmd('ObsidianTemplate daily_note.md')
        end
      end,
    })
  end
}
