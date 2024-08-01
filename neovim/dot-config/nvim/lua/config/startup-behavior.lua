-- This module simply checks if any arguments were passed to Neovim (file/dir), and opens Oil if none
-- Effectively, if no file or dir is specified, Neovim starts as if it was called with `nvim .`

local function open_cwd_if_no_args()
    local args = vim.fn.argv()
    if #args == 0 then
        vim.schedule(require("oil").open)
    end
end

vim.api.nvim_create_autocmd("VimEnter", { callback = open_cwd_if_no_args })
