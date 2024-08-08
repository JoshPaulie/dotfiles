return {
    -- mason
    {
        "williamboman/mason.nvim", opts = {}
    },
    -- brige mason & lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "ruff",
                "ruff_lsp",
            },
        }
    },
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')

            local function set_keymap(mode, key, action, desc, bufnr)
                vim.keymap.set(mode, key, action, { noremap = true, silent = true, desc = desc, buffer = bufnr })
            end

            -- Function to set up key bindings for LSP
            local on_attach = function(client, bufnr)
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
                set_keymap('n', 'gd', vim.lsp.buf.definition, "[G]oto [d]efinition", bufnr)
                set_keymap('n', 'K', vim.lsp.buf.hover, "Hover documentation", bufnr)
                set_keymap('n', 'gi', vim.lsp.buf.implementation, "[G]oto [i]mplementation", bufnr)
                set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, "Signature help", bufnr)
                set_keymap('n', '<leader>rn', vim.lsp.buf.rename, "[R]e[n]ame", bufnr)
                set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, "[C]ode [a]ction", bufnr)
                set_keymap('n', 'gr', vim.lsp.buf.references, "[G]oto [r]eferences", bufnr)
            end

            -- Servers and config
            -- Python
            lspconfig.ruff.setup({ -- Formatter
                on_attach = on_attach,
                init_options = {
                    settings = {
                        lint = {
                            enable = false
                        }
                    }
                }

            })
            lspconfig.pyright.setup({ -- LSP
                on_attach = on_attach,
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
