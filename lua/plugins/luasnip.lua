return {
  'L3MON4D3/LuaSnip',
  wants = { 'friendly-snippets', 'vim-snippets' },
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    -- my snippets
    ls.add_snippets("markdown", {
      s("[] ", { t("- [ ] ") })
    })
  end,
}
