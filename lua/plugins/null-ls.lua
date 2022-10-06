local present, null_ls = pcall(require, 'null-ls')

if not present then
    return
end

null_ls.setup({
    sources = {
        -- SQLFluff
        null_ls.builtins.diagnostics.sqlfluff.with({
            condition = function()
                return vim.fn.executable('sqlfluff') > 0
            end,
            extra_args = { '--dialect', 'bigquery' }, -- change to your dialect
        }),
        null_ls.builtins.formatting.sqlfluff.with({
            condition = function()
                return vim.fn.executable('sqlfluff') > 0
            end,
            extra_args = { '--dialect', 'bigquery' }, -- change to your dialect
        }),
        -- Hadolint
        null_ls.builtins.diagnostics.hadolint.with({
            condition = function()
                return vim.fn.executable('hadolint') > 0
            end,
        }),
        -- prettier
        null_ls.builtins.formatting.prettier.with({
            filetypes = { 'json', 'yaml', 'markdown', 'vimwiki', 'xml' },
            extra_args = function(params)
                if params.ft == 'markdown' or params.ft == 'vimwiki' then
                    return { '--tab-width', '4' }
                elseif params.ft == 'xml' then
                    return { '--parser', 'xml' }
                end
            end,
            condition = function()
                return vim.fn.executable('prettier') > 0
            end,
        }),
    }
})
