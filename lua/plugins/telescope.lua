-- multi-purpose search utility and fuzzy finder
return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'Telescope',
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
    pickers = {
      live_grep = {
        additional_args = { '--hidden' },
      },
      find_files = {
        hidden = true
      }
    },
  },
  keys = {
    { '<leader>sr', ':Telescope oldfiles<CR>',    desc = '[S]earch [R]ecently opened files' },
    { '<leader>sf', ':Telescope find_files<CR>',  desc = '[S]earch [F]iles' },
    { '<leader>st', ':Telescope git_files<CR>',   desc = '[S]earch [T]racked files (git)' },
    { '<leader>sc', ':Telescope git_commits<CR>', desc = '[S]earch [C]ommits (git)' },
    { '<leader>sh', ':Telescope help_tags<CR>',   desc = '[S]earch [H]elp' },
    { '<leader>sw', ':Telescope grep_string<CR>', desc = '[S]earch [W]ord' },
    { '<leader>sg', ':Telescope live_grep<CR>',   desc = '[S]earch [G]rep' },
    { '<leader>sd', ':Telescope diagnostice<CR>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sk', ':Telescope keymaps<CR>',     desc = '[S]earch [K]eymaps' },
    { '<leader>sb', ':Telescope buffers<CR>',     desc = '[S]earch [B]uffers' },
    { '<leader>sj', ':Telescope jumplist<CR>',    desc = '[S]earch [J]umplist' },
    {
      -- current buffer fuzzy should have a different theme
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      desc = '[/] Fuzzily search in current buffer'
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
