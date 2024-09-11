return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup()
        local opts = {}
        vim.keymap.set('n', '<leader>n', [[:NvimTreeToggle<CR>]], opts)
    end
}
