return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ruff",
                    "ruff_lsp",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')

            -- Function to set up key bindings for LSP
            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local keymap = vim.keymap.set

                -- Format on save
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end
                    })
                end

                -- LSP key bindings
                keymap('n', 'gd', vim.lsp.buf.definition, opts)
                keymap('n', 'K', vim.lsp.buf.hover, opts)
                keymap('n', 'gi', vim.lsp.buf.implementation, opts)
                keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
                keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                keymap('n', 'gr', vim.lsp.buf.references, opts)
            end

            -- Servers and config
            -- Python
            lspconfig.ruff.setup({
                on_attach = on_attach
            })
            lspconfig.ruff_lsp.setup({
                on_attach = on_attach
            })

            -- Lua
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                    },
                },
            })
        end,
    },
}
