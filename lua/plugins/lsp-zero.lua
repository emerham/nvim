return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },
    -- Snippet Engin
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            {"rafamadriz/friendly-snippets"},
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'saadparwaiz1/cmp_luasnip', -- Snippet completion for LuaSnip
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'luasnip'},
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                        --vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "cssls",
                    "html",
                    "intelephense",
                    "ansiblels",
                    "yamlls",
                    'texlab',
                },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    intelephense = function()
                        require('lspconfig').intelephense.setup({
                            root_dir = function(fname)
                                return vim.loop.cwd()
                            end,
                            settings = {
                                intelephense = {
                                    files = {
                                        maxSize = 1000000,
                                        associations={
                                            "*.php",
                                            "*.module",
                                            "*.inc"
                                        }
                                    },
                                    environment = {
                                        documentRoot = "/home/brabhamm/PhpstormProjects/drupal-8-core/web",
                                        includePaths = {
                                            "/home/brabhamm/PhpstormProjects/drupal-8-core/web/core",
                                            "/home/brabhamm/PhpstormProjects/drupal-8-core/vendor"
                                        }
                                    }
                                },
                            },
                        })
                    end,
                    yamlls = function()
                        require('lspconfig').yamlls.setup({
                            settings = {
                                yaml = {
                                    schemas = {
                                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                                        ["/path/from/root/of/project"] = "/.github/workflows/*",
                                    },
                                }
                            }
                        })
                    end,
                    ansiblels = function()
                        require('lspconfig').ansiblels.setup({
                            filetypes = {
                                "yaml.ansible"
                            },
                            settings = {
                                ansible = {
                                    ansible = {
                                        path = "ansible"
                                    },
                                    executionEnvironment = {
                                        enabled = false
                                    },
                                    python = {
                                        interpreterPath = "python"
                                    },
                                    validation = {
                                        enabled = true,
                                        lint = {
                                            enabled = true,
                                            path = "ansible-lint"
                                        }
                                    }
                                }
                            }
                        })
                    end,
                    lua_ls = function()
                        require('lspconfig').lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics ={
                                        globals ={'vim'}
                                    }
                                }
                            }
                        })
                    end
                }
            })
        end
    }
}
