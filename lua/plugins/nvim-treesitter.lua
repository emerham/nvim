return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
    lazy = false,
    build = ':TSUpdate',

    config = function()
        local treesitter = require('nvim-treesitter')

        local pattern = {
            'bash',
            'css',
            'html',
            'javascript',
            'json',
            'latex',
            'lua',
            'php',
            'rust',
            'twig',
            'yaml',
            'zsh',
        }
        treesitter.install(pattern)

        vim.treesitter.language.register('latex', { 'tex' })
        vim.api.nvim_create_autocmd('FileType', {
            -- Use to add buffer types for languages
            table.insert(pattern, 'tex'),
            pattern = pattern,
            callback = function(ev)
                -- Identify the parser name. 
                -- If the filetype is 'module', use the 'php' parser.
                local lang = vim.bo[ev.buf].filetype
                if lang == 'module' or lang == 'inc' or lang == 'theme' then
                    lang = 'php'
                end
                if lang == 'tex' then
                    lang = 'latex'
                end

                -- Start TS explicitly on the buffer that triggered the event
                local success, err = pcall(vim.treesitter.start, ev.buf, lang)

                if success then
                    vim.bo[ev.buf].syntax = 'on'
                    --vim.bo[ev.buf].smartindent = false
                    --vim.bo[ev.buf].cindent = false
                    --vim.bo[ev.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
                else
                    vim.notify("TS failed for " .. lang .. ": " .. err, vim.log.levels.WARN)
                end
            end
        })
    end
}
