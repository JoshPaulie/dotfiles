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

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

