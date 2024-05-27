local map = vim.keymap.set

-- set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- clipboard
map('v', '<leader>y', '"+y', { silent = true })
map('n', '<leader>y', '"+y', { silent = true })
map('n', '<leader>yy', '"+yy', { silent = true })
map('n', '<leader>p', '"+p', { silent = true })
map('v', '<leader>p', '"+p', { silent = true })

-- Helix inspired redo
map('n', 'U', '<C-r>', { silent = true, desc = 'Redo' })
-- Helix inspired go left and right
map('n', 'gh', '0', { silent = true, desc = 'go to start of line' })
map('n', 'gl', '$', { silent = true, desc = 'go to end of line' })

-- quickfix list
map('n', '<leader>q', ':copen<CR>', { silent = true, desc = 'Open quickfix list' })
map('n', '<leader>j', ':cnext<CR>', { silent = true, desc = 'Next quickfix item' })
map('n', '<leader>k', ':cprev<CR>', { silent = true, desc = 'Prev quickfix item' })

-- move window shortcuts
map('n', '<C-h>', '<C-w>h', { desc = 'Window go left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window go down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window go up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window go right' })

-- switch to a new session in tmux
map('n', '<C-f>', ':!tmux neww cli.tmux.projectSessioniser<CR><CR>',
  { silent = true, desc = 'switch to a new session in tmux' })

-- keeping these but I don't like how they work, commented out for now
-- start a replace with current word
-- map("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], make_opts('[F]ind and [R]eplace', opts))
-- same but with current visual selection
-- map("v", "<leader>fr", [[y<Esc>:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], make_opts('[F]ind and [R]eplace', opts))
--
-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- make current file executable
map('n', '<leader>x', ':!chmod +x %<CR>', { silent = true, desc = 'make current file executable' })

-- toggles
map('n', '<leader>tw', ':set wrap!<CR>', { silent = true, desc = '[T]oggle [W]rap' })
map('n', '<leader>tl', ':set relativenumber!<CR>', { silent = true, desc = '[T]oggle [L]ine numbers' })

-- a handy wrap remapping
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '<leader>[', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', '<leader>]', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal keymaps
map('t', '<Esc>', '<C-\\><C-n>', { silent = true, desc = 'Exit terminal mode' })

-- Some code to toggle checkboxes in markdown
function toggle_checkbox()
  local line_number = vim.fn.line('.')
  local line = vim.fn.getline(line_number)
  if line:match('- %[%s%]') then
    line = line:gsub('- %[%s%]', '- [x]')
  elseif line:match('- %[%a%]') then
    line = line:gsub('- %[%a%]', '- [ ]')
  else
    print('No checkbox found at line ' .. line_number)
    return
  end
  vim.fn.setline(line_number, line)
end

-- Function to wrap selected text into wiki link format
local function wrap_text_into_wiki_link(text)
  local wrapped_text

  -- Format the wrapped text based on selection
  if string.match(text, "%u") then
    -- Selected text contains uppercase letters
    local formatted_text = text:lower()
    wrapped_text = "[[" .. formatted_text .. "|" .. text .. "]]"
  elseif string.match(text, "%s") then
    -- Selected text contains spaces (multiple words)
    local formatted_text = text:gsub("%s", "_")
    wrapped_text = "[[" .. formatted_text .. "|" .. text .. "]]"
  else
    -- Single word, no capital letters
    wrapped_text = "[[" .. text .. "]]"
  end

  return wrapped_text
end

function wrap_wiki_link_normal()
  -- Clear the contents of the default register
  vim.fn.setreg('"', '')

  -- Use word under cursor
  local selected_text = vim.fn.expand("<cword>")

  -- Check if selected text is empty
  if selected_text == "" then
    print("No text selected.")
    return
  end

  -- Wrap selected text into wiki link format
  local wrapped_text = wrap_text_into_wiki_link(selected_text)

  -- Replace selected text with wrapped text
  vim.fn.setreg('"', wrapped_text)
  vim.cmd('normal! "_d')
  vim.cmd('normal! viw')
  vim.cmd('normal! ""p')
end

function wrap_wiki_link_visual()
  -- Clear the contents of the default register
  vim.fn.setreg('"', '')

  -- Get the current selection
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]
  local selected_text = ""
  if start_line == end_line then
    -- Single line selection
    selected_text = vim.fn.getline(start_line):sub(vim.fn.getpos("'<")[3], vim.fn.getpos("'>")[3])
  else
    -- Multi-line selection
    selected_text = table.concat(vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false), "\n")
  end

  -- Check if selected text is empty
  if selected_text == "" then
    print("No text selected.")
    return
  end

  -- Wrap selected text into wiki link format
  local wrapped_text = wrap_text_into_wiki_link(selected_text)

  -- Replace selected text with wrapped text
  vim.fn.setreg('"', wrapped_text)
  vim.cmd('normal! "_d')
  vim.cmd('normal! gv')
  vim.cmd('normal! "_dP')
end

-- Since I will mostly use this in my obsidian vault, I'm going to continue to use the <leader>o convention.
vim.api.nvim_set_keymap('n', '<leader>oc', ':lua toggle_checkbox()<CR>',
  { noremap = true, desc = '[O]bsidian [C]heckbox' })
vim.api.nvim_set_keymap('n', '<leader>ol', ':lua wrap_wiki_link_normal()<CR>',
  { noremap = true, desc = '[O]bsidian [L]ink' })
vim.api.nvim_set_keymap('x', '<leader>ol', ':lua wrap_wiki_link_visual()<CR>',
  { noremap = true, desc = '[O]bsidian [L]ink' })
