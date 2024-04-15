return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  event = { 'BufReadPre ' .. vim.fn.expand '~' .. '/documents/obsidian/**.md' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>od', vim.cmd.ObsidianToday,      desc = '[O]bsidian [D]aily note for Today' },
    {
      '<leader>oy',
      function()
        vim.cmd("ObsidianToday -1")
      end,
      desc = '[O]bsidian [Y]esterday'
    },
    {
      '<leader>or',
      function()
        vim.cmd("ObsidianDailies -30 1")
      end,
      desc = '[O]bsidian [R]ecent]'
    },
    { '<leader>oo', vim.cmd.ObsidianOpen,       desc = '[O]bsidian [O]pen' },
    { '<leader>ot', vim.cmd.ObsidianTemplate,   desc = '[O]bsidian [T]emplate' },
    { '<leader>on', vim.cmd.ObsidianNew,        desc = '[O]bsidian [N]ew' },
    { '<leader>of', vim.cmd.ObsidianFollowLink, desc = '[O]bsidian [F]ollow Link' },
    { '<leader>ob', vim.cmd.ObsidianBacklink,   desc = '[O]bsidian show [B]acklinks' },
  },
  opts = {
    -- dir = '~/documents/obsidian/personal-vault',
    workspaces = {
      {
        name = "personal",
        path = '~/documents/obsidian/personal-vault',
      },
    },
    note_id_func = function(title)
      return title
    end,
    notes_subdir = 'notes',
    daily_notes = {
      folder = 'dailies',
      date_format = '%Y-%m-%d',
      template = 'daily_note.md',
    },
    templates = {
      subdir = 'templates',
    },
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,
    new_notes_location = 'notes_subdir',
    wiki_link_func = function(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,
    open_app_foreground = true,
    disable_frontmatter = true,
    mappings = {},
  },
  config = function(_, opts)
    require('obsidian').setup(opts)
    -- autocmds
    local augroup = vim.api.nvim_create_augroup('lucidph3nx_obsidian', {})
    -- autocommand to set keybindings only in obsidian backlinks buffer
    vim.api.nvim_create_autocmd('FileType', {
      group = augroup,
      pattern = '*',
      callback = function()
        -- only applies to files with filetype ObsidianBacklinks
        if vim.bo.ft ~= "ObsidianBacklinks" then
          return
        end
        local bufnr = vim.api.nvim_get_current_buf()

        -- quit buffer
        vim.keymap.set('n', 'q', function()
          vim.cmd('q')
        end, { buffer = bufnr, desc = '[Q]uit' })
      end,
    })
  end
}
