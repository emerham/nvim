function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    -- vim.cmd.colorscheme(color)

    vim.cmd.colorscheme 'dracula'
    -- vim.cmd.colorscheme 'dracula-soft'

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        'maxmx03/dracula.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            ---@type dracula
            local dracula = require "dracula"

            dracula.setup({
                styles = {
                    Type = {},
                    Function = {},
                    Parameter = {},
                    Property = {},
                    Comment = {},
                    String = {},
                    Keyword = {},
                    Identifier = {},
                    Constant = {},
                },
                transparent = false,
                on_colors = function (colors, color)
                    ---@type dracula.palette
                    return {
                        -- override or create new colors
                        mycolor = "#ffffff",
                        -- mycolor = 0xffffff,
                    }
                end,
                on_highlights = function (colors, color)
                    ---@type dracula.highlights
                    return {
                        ---@type vim.api.keyset.highlight
                        Normal = { fg = colors.mycolor }
                    }
                end,
                plugins = {
                    ["nvim-treesitter"] = true,
                    ["rainbow-delimiters"] = true,
                    ["nvim-lspconfig"] = true,
                    ["nvim-navic"] = true,
                    ["nvim-cmp"] = true,
                    ["indent-blankline.nvim"] = true,
                    ["neo-tree.nvim"] = true,
                    ["nvim-tree.lua"] = true,
                    ["which-key.nvim"] = true,
                    ["dashboard-nvim"] = true,
                    ["gitsigns.nvim"] = true,
                    ["neogit"] = true,
                    ["todo-comments.nvim"] = true,
                    ["lazy.nvim"] = true,
                    ["telescope.nvim"] = true,
                    ["noice.nvim"] = true,
                    ["hop.nvim"] = true,
                    ["mini.statusline"] = true,
                    ["mini.tabline"] = true,
                    ["mini.starter"] = true,
                    ["mini.cursorword"] = true,
                    ['bufferline.nvim'] = true,
                }
            })
            ColorMyPencils();
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = vim.g.colors_name,
                refresh = {
                    statusline = 1000,
                },
            },
        },
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })
            --ColorMyPencils();
        end
    },
}
