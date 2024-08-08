-- Better shifting (tabbing) line select
-- (reselects the lines after moving them)
vim.keymap.set('v', '>', '>gv', { remap = true })
vim.keymap.set('v', '<', '<gv', { remap = true })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use \'h\' to move left ←"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use \'l\' to move right →"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use \'k\' to move up ↑"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use \'j\' to move down ↓"<CR>')

-- Easy split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Bit easier autocomplete
vim.keymap.set('i', '<C-j>', '<C-n>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<C-p>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-Enter>', '<C-y>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-c>', '<C-e>', { noremap = true, silent = true })

-- Keymaps all lines all lines
vim.keymap.set('n', '<leader>aa', 'ggVG', { noremap = true, silent = true, desc = "Visually select [a]ll lines" })
vim.keymap.set('n', '<leader>ay', 'ggVGy', { noremap = true, silent = true, desc = "[A]ll line [y]ank" })

-- My fav way to save
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "[W]rite document" })

-- Escape with jk
vim.keymap.set('i', 'jk', "<Esc>")
