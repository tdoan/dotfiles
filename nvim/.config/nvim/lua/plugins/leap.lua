return {
    "ggandor/leap.nvim",
    config = function()
        -- require('leap').create_default_mappings()
        vim.keymap.set({'n', 'x', 'o'}, '1',  '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, '2',  '<Plug>(leap-backward)')
        vim.keymap.set({'n', 'x', 'o'}, 'g1', '<Plug>(leap-from-window)')
    end
}
