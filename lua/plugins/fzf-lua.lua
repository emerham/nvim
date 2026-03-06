return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            local fzflua = require('fzf-lua')
            fzflua.setup({})
            vim.keymap.set('n', '<leader>ff', fzflua.files, { desc = "FZF Files" })
            vim.keymap.set('n', '<C-p>', fzflua.git_files, { desc = "FZF Git Files" })
            vim.keymap.set('n', '<leader>gf', fzflua.git_files, { desc = "FZF Git Files" })
            vim.keymap.set('n', '<leader>fb', fzflua.buffers, { desc = "FZF Buffers" })
            vim.keymap.set('n', '<leader>fh', fzflua.help_tags, { desc = "FZF Help Tags" })
            vim.keymap.set('n', '<leader>fg', fzflua.live_grep, { desc = "FZF Live Grep" })
            vim.keymap.set('n', '<leader>fw', fzflua.grep_cword, { desc = "FZF Grep Word Under Cursor" })
            vim.keymap.set('v', '<leader>fw', fzflua.grep_visual, { desc = "FZF Grep Selection" })
        end
    }
}
