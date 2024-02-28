-- cmp source for copilot
return {
  'zbirenbaum/copilot-cmp',
  after = { "copilot.lua" },
  config = function()
    require('copilot_cmp').setup()
  end
}
