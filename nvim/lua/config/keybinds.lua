-- function MyNvimTreeSmartToggle()
--   local ok_api, api = pcall(require, 'nvim-tree.api')
--   local ok_view, view = pcall(require, 'nvim-tree.view')
--   if not (ok_api and ok_view) then
--     return
--   end
--
--   if not view.is_visible() then
--     api.tree.open()
--   else
--     local tree_win = view.get_winnr()
--     local current_win = vim.api.nvim_get_current_win()
--     if tree_win == current_win then
--       api.tree.close()
--     else
--       api.tree.focus()
--     end
--   end
-- end
function MyNeoTreeSmartToggle()
  -- local neotree = require 'neo-tree'
  local winid = vim.fn.bufwinid 'neo-tree filesystem [1]' -- default window title
  local current_win = vim.api.nvim_get_current_win()

  if winid == -1 then
    -- Neo-tree is not visible, open it
    vim.cmd 'Neotree toggle'
  elseif winid == current_win then
    -- If currently in Neo-tree window, close it
    vim.cmd 'Neotree toggle'
  else
    -- If Neo-tree is open but not focused, focus it
    vim.cmd 'Neotree focus'
  end
end

-- Save file
vim.keymap.set('n', '<leader>w', vim.cmd.write)

-- Select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', { desc = 'Select [A]ll' })

-- jj instead of esc
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Disable arrow keys in insert and normal mode
vim.keymap.set({ 'n', 'i' }, '<left>', '<cmd>echo "Use h to move left!!"<CR>')
vim.keymap.set({ 'n', 'i' }, '<right>', '<cmd>echo "Use l to move right!!"<CR>')
vim.keymap.set({ 'n', 'i' }, '<up>', '<cmd>echo "Use k to move up!!"<CR>')
vim.keymap.set({ 'n', 'i' }, '<down>', '<cmd>echo "Use j to move down!!"<CR>')

-- Keybinds to make split navigation easier
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
-- Open NvimTree

vim.keymap.set('n', '<leader>e', '<cmd>lua MyNeoTreeSmartToggle()<CR>', { noremap = true, silent = true })

-- Telescope mappings
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>', { desc = '[] Find existing buffers' })
vim.keymap.set('n', '<leader>.', '<cmd>Telescope oldfiles<cr>', { desc = '[F]ind Recent Files' })
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope find_files<cr>', { desc = '[F]ind [P]roject Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<C-p>', '<cmd>Telescope git_files<cr>', { desc = '[F]ind in [G]it files' })
vim.keymap.set('n', '<leader>sk', '<cmd>Telescope keymaps<cr>', { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = '[/] Fuzzily search in current buffer' })

-- Undotree mappings
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

-- Use J and K to move selected code up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor in middle of the screen when using following commands
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Don't replace register when pasting
vim.keymap.set('x', '<leader>p', '"_dP')

-- Interaction with system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
