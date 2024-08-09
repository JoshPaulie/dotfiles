local group = vim.api.nvim_create_augroup('csv_rainbow_align', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    pattern = '*.csv',
    callback = function()
        vim.cmd('RainbowAlign')
    end,
    desc = 'Run :RainbowAlign on saving .csv files',
})

return {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
    },
    cmd = {
        'RainbowDelim',
        'RainbowDelimSimple',
        'RainbowDelimQuoted',
        'RainbowMultiDelim'
    }
}
