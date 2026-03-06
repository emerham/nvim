-- Disable checking if we are in a large file
--local function ts_disable(_, bufnr)
--    return vim.api.nvim_buf_line_count(bufnr) > 5000
--end
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()
        treesitter.install {"vim", "vimdoc", "javascript", "typescript", "lua", "rust", "jsdoc", "bash", "php", "phpdoc", "html", "css", "latex", "markdown"}
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function() vim.treesitter.start() end,
        })

    end
}
