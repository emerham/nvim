--
local lua_line_theme
--- Setup colors
-- @param color the color name
function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    --vim.cmd.colorscheme 'dracula'
    vim.cmd.colorscheme(color)
    if color == 'dracula' then
        lua_line_theme = 'dracula-nvim'
    else
        lua_line_theme = color
    end

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
        "Mofiqul/dracula.nvim",
        config = function()
            require('dracula').setup({
                ColorMyPencils('dracula')
            })
        end,
        opts = { }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        opts = {
            options = {
                theme = lua_line_theme,
                refresh = {},
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
