return {
    'stevearc/conform.nvim',
    opts = {},
    config = function ()
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                php = { "php_cs_fixer", "phpcbf" },
                rust = { "rustfmt" },
                lua = { "stylua" },
                yaml = { "prettier" },
            },
        })
    end,
}
