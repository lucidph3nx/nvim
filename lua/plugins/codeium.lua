return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    -- disable default bindings
    vim.g.codeium_disable_bindings = true
    -- my bindings
    vim.keymap.set('i', '<C-L>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<C-J>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<C-K>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  end,
}
