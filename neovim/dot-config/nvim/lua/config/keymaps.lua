-- better shifting (tabbing) line select
-- (reselects the lines after moving them)
vim.keymap.set('v', '>', '>gv', { remap = true })
vim.keymap.set('v', '<', '<gv', { remap = true })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use \'h\' to move left ←"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use \'l\' to move right →"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use \'k\' to move up ↑"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use \'j\' to move down ↓"<CR>')
