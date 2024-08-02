vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
