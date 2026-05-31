-- For conciseness
local opts = { noremap = true, silent = true }
-- Set leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Disable the spacebar key's default behavior in Normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Toggle neo tree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', opts)
-- Toggle buffer list (floating window)
-- vim.keymap.set('n','<leader>b','<cmd>Neotree float toggle buffers<CR>',opts)
-- Git status (floating window)
vim.keymap.set('n', '<leader>gf', '<cmd>Neotree float git_status<CR>', opts)

-- Make file executable (Unix only)
if vim.fn.has 'win32' == 0 then
  vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
end

-- Resize with arrow
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffer
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Yazi     Open yazi at the current file
vim.keymap.set({ 'n', 'v' }, '<leader>yf', '<cmd>Yazi<cr>', opts)
-- Open in the current working directory
vim.keymap.set({ 'n', 'v' }, '<leader>cf', '<cmd>Yazi cwd<cr>', opts)
-- Resume the last yazi session
vim.keymap.set({ 'n', 'v' }, '<leader>ct', '<cmd>Yazi toggle<cr>', opts)

vim.keymap.set({ 'n', 'v' }, 'H', '^', opts) -- start (non-blank)
vim.keymap.set({ 'n', 'v' }, 'L', '$', opts) -- end of line

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
