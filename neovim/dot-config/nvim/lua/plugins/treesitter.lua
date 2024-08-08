return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            -- Treesitter settings
            ensure_installed = {
                "lua",
                "python",
                "go"
            },
            sync_install = false, -- Installs "ensure installed" langs asynchronously
            auto_install = true,
            highlight = {
                enable = true,
                disable = {
                    "csv", -- Disable for rainbow_csv
                }
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },

            -- Textobjects settings
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@statement.outer",
                        ["aa"] = "@assignment.rhs",
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V',  -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    include_surrounding_whitespace = false,
                },
            },
        })
    end
}
