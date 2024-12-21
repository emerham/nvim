return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
            local fzflua = require('fzf-lua')
            vim.keymap.set('n', '<leader>ff', fzflua.files, {})
            vim.keymap.set('n', '<C-p>', fzflua.git_files, {})
        end
    }
}
