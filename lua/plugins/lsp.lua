return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "intelephense",
                "html",
                "cssls",
                "ts_ls",
                "eslint",
                "yamlls",
                "twiggy_language_server",
                "texlab",
                "sqls"
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
            vim.lsp.config("*", {
                -- on_attach = function(client, bufnr) ... end,
            })
            vim.lsp.config("intelephense", {
                cmd = { "intelephense", "--stdio" },
                filetypes = { "php", "module", "inc", "theme" },
                root_markers = { "composer.json", ".git" },
                settings = {
                    intelephense = {
                        files = { maxSize = 5000000 },
                    }
                },
            })
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                    },
                },
            })
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = { command = "clippy" }
                    }
                }
            })
            vim.lsp.enable({
                "lua_lsp",
                "rust_analyzer",
                "intelephense",
                "html",
                "cssls",
                "ts_ls",
                "eslint",
                "yamlls",
                "texlab",
                "sqls" })
        end,
    },
}
