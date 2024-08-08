return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
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
        })
    end
}
