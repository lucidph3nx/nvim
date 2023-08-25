local set = vim.opt

-- disable netrw, I use nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
set.nu = true
-- user relative line numbers (keybind to toggle)
set.relativenumber = true
-- highlight the line of a cursor
set.cursorline = true

-- tab definitions
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true

-- indent automatically on newline
set.smartindent = true
-- wrapped lines should ignore indent
set.breakindent = true

-- wrap disabled by default (keybind to toggle)
set.wrap = false

-- save undo history
set.undofile = true
-- no swap file
set.swapfile = false

-- case insensitive search
set.ignorecase = true
-- unless a capital letter is used
set.smartcase = true

-- disable highlight on search (esc keybound to clear)
set.hlsearch = true

set.termguicolors = true
-- keep signcolumn always visible
set.signcolumn = 'yes'
set.showmode = false -- I use lualine and don't need to see the mode twice

-- when splitting, open new window below/right
set.splitright = true
set.splitbelow = true
set.scrolloff = 8

-- decrease update time
set.updatetime = 250
set.timeoutlen = 1000

set.completeopt = 'menuone,noselect'

-- disable mouse
set.mouse = ''


-- vim diagnostice messages - tell me the lsp it came from
vim.diagnostic.config({
virtual_text = {
    source = true,
    format = function(diagnostic)
        if diagnostic.user_data and diagnostic.user_data.code then
            return string.format('%s %s', diagnostic.user_data.code, diagnostic.message)
        else
            return diagnostic.message
        end
    end,
},
signs = true,
float = {
    header = 'Diagnostics',
    source = true,
    border = 'rounded',
},
})
