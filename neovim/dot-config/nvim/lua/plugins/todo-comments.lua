return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            FIX  = { alt = { "fix" } },
            TODO = { alt = { "todo" } },
            HACK = { alt = { "hack" } },
            WARN = { alt = { "warn" } },
            PERF = { alt = { "perf" } },
            NOTE = { alt = { "note" } },
            TEST = { alt = { "test" } },
        },
        highlight = {
            keyword = "fg"
        }
    }
}
