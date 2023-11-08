return {
  'preservim/vim-markdown',
  branch = 'master',
  lazy = true,
  event = { 'BufReadPre **.md' },
  dependencies = {
    'godlygeek/tabular'
  },
  config = function()
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_frontmatter = 0
    vim.g.vim_markdown_auto_insert_bullets = 0
    vim.opt.conceallevel = 2
  end
}
