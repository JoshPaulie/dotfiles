vim.opt.clipboard:append("unnamedplus")

vim.wo.relativenumber = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim-undo')

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.opt.listchars = { space = '·', tab = '>·', trail = '~', extends = '>', precedes = '<', eol = ''}
vim.api.nvim_set_keymap('n', '<leader>tl', ':set list!<CR>', { noremap = true, silent = true })

-- better shifting (tabbing) line select
vim.keymap.set('v', '>', '>gv', { remap = true })
vim.keymap.set('v', '<', '<gv', { remap = true })

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move left"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move right"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move up"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move down"<CR>')
