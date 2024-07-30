-- This don't work, lol
local function open_current_directory()
    local args = vim.fn.argv()
    if #args == 0 then
        vim.cmd("cd .")
        require('oil').open()
        print("No arguments passed, starting Oil. (It didn't start.. did it?)")
    end
end

-- Attach function to startup event
vim.api.nvim_create_autocmd("VimEnter", { callback = open_current_directory })

