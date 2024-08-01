-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim-undo')

-- Sane tabbing
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Whitespace characters
vim.opt.listchars = { space = '·', tab = '>·', trail = '~', extends = '>', precedes = '<', eol = '' }
vim.api.nvim_set_keymap('n', '<leader>tl', ':set list!<CR>', { noremap = true, silent = true })

-- Search highlighting
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Cursor follows new splits
vim.opt.splitbelow = true
vim.opt.splitright = true
