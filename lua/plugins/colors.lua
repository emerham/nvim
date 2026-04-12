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
}
