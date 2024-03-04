-- make the AI do the work
return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = "InsertEnter",
  -- keys = {
  -- { '<C-L>',      vim.cmd.Copilot('suggestion accept'), desc = 'Accept Suggestion' },
  -- { '<C-J>',      vim.cmd.Copilot('suggestion next'),   desc = 'Next Suggestion' },
  -- { '<C-K>',      vim.cmd.Copilot('suggestion prev'),   desc = 'Previous Suggestion' },
  -- -- open copilot panel
  -- { '<leader>cp', vim.cmd.Copilot('panel open'),        desc = '[C]opilot [P]anel' },
  -- },
  opts = {
    panel = {
      enabled = true,
      auto_refresh = false,
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4
      },
      keymap = {
        open = '<leader>cp',
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<C-L>',
        next = '<C-J>',
        prev = '<C-K',
      },
    },
    filetypes = {
      markdown = true,
      yaml = true,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = true,
      rust = false, -- while learning rust, no copilot
    },
  },
  config = function(_, opts)
    require('copilot').setup(opts)
  end,
}
