return {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat', keys = { '.' } },
    config = function()
        local leap = require('leap')
        leap.add_default_mappings(true)
    end,
}
