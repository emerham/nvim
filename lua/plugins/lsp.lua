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
        opts = { },
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
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
            vim.lsp.config("*", {
                -- on_attach = function(client, bufnr) ... end,
            })
            vim.lsp.config("intelephense", {
                cmd = { "intelephense", "--stdio" },
                filetypes = { "php" },
                root_markers = { ".git", ".env", {"composer.lock", "composer.json"} },
                settings = {
                    intelephense = {
                        files = { maxSize = 5000000 },
                    }
                },
            })
            vim.lsp.config("twiggy_language_server", {
                filetypes = { "twig", "html.twig", "xml.twig" },
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
            vim.lsp.config("yamlls", {
                settings = {
                    yaml = {
                        validate = true,
                        schemas = {
                            ["https://www.schemastore.org/drupal-recipe.json"] = {
                                "**/recipes/**/*.yml",
                                "**/recipe.yml",
                                "drupal-recipe.yml"
                            },
                        },
                        schemaStore = {
                            enable = true,
                        },
                    },
                },
            })
            vim.lsp.enable({
                "cssls",
                "eslint",
                "html",
                "intelephense",
                "lua_ls",
                "rust_analyzer",
                "sqls",
                "texlab",
                "ts_ls",
                "twiggy_language_server",
                "yamlls" })
        end,
    },
}
