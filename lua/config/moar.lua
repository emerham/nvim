---
local augroup = vim.api.nvim_create_augroup
local MoarGroup = augroup('Moar', {})
local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
    group = MoarGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        --vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'K', function ()
            vim.lsp.buf.hover { max_height = 25, max_width = 100 }
        end, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        -- Conform shortcut
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            require("conform").format({
                lsp_fallback = true,
                async = true,
                timeout_ms = 1000,
            })
        end, { buffer = e.buf, desc = "Conform formatter" })
    end
})
