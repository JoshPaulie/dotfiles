local function open_cwd_if_no_args()
    local args = vim.fn.argv()
    if #args == 0 then
        vim.schedule(require("oil").open)
    end
end

vim.api.nvim_create_autocmd("VimEnter", { callback = open_cwd_if_no_args })

