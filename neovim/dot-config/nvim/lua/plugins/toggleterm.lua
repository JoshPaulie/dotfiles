return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        -- Plugin config
        require("toggleterm").setup({
            float_opts = {
                border = "curved"
            },
            highlights = {
                FloatBorder = {
                    guifg = "#b7bdf8",
                },
            }
        })

        -- Create Terminal for Lazygit
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        -- Lazygit mapping
        vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Open LazyGit"})
    end,
}


