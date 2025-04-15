return {
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")
            rt.setup()
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup(
                {
                    ensure_installed = {"lua_ls"}
                })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup {}
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'grn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', 'grr', vim.lsp.buf.references, {})
            lspconfig.pyright.setup {}
            lspconfig.ts_ls.setup {}
            lspconfig.rust_analyzer.setup {
                -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    ['rust-analyzer'] = {},
                },
            }
        end
    }
}
