return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter_configs = require("nvim-treesitter.configs")
        treesitter_configs.setup({
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "json",
                "rust",
                "yaml",
                "toml",
                "ruby",
                "python",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore"
            },
        })
    end
}
