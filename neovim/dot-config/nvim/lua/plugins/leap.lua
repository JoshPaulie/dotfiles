return {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat', keys = { '.' } },
    config = function(_, opts)
        local leap = require('leap')
        leap.add_default_mappings(true)
    end,
}
