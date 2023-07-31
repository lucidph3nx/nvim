-- very useful git plugin
return {
  'tpope/vim-fugitive',
  dependencies = { 'tpope/vim-rhubarb', on = 'Git' },
  on = 'Git',
  keys = {
    { '<leader>gs', vim.cmd.Git,            desc = '[G]it [S]tatus in Fugitive' },
    -- a couple keymaps for merge conflicts
    { 'gh',         '<cmd>diffget //2<CR>', desc = '[G]it, left side of merge diff' },
    { 'gl',         '<cmd>diffget //2<CR>', desc = '[G]it, right side of merge diff' },
  },
  config = function()
    -- autocommand to set keybindings only in fugitive buffers
    local augroup = vim.api.nvim_create_augroup('lucidph3nx_fugitive', {})
    vim.api.nvim_create_autocmd('FileType', {
      group = augroup,
      pattern = '*',
      callback = function()
        -- only applies to files with filetype fugitive
        if vim.bo.ft ~= "fugitive" then
          return
        end
        local bufnr = vim.api.nvim_get_current_buf()

        -- keymap for git push
        vim.keymap.set("n", "<leader>p", function()
          vim.cmd.Git('push')
        end, { buffer = bufnr, desc = '[P]ush' })

        -- keymap for git pull with rebase
        vim.keymap.set("n", "<leader>P", function()
          vim.cmd.Git('pull --rebase')
        end, { buffer = bufnr, desc = '[P]ull with rebase' })

        -- open git repo in browser (requires vim-rhubarb)
        vim.keymap.set('n', '<leader>gb', ':GBrowse<CR>', {desc = '[G]it [B]rowse'})
      end,
    })
  end,
}
