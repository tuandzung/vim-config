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
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { 'vimwiki', 'xml', 'yaml' },
            extra_args = function(params)
                if params.ft == 'vimwiki' then
                    return { '--tab-width', '4' }
                elseif params.ft == 'xml' then
                    return { '--parser', 'xml' }
                end
            end,
            condition = function()
                return vim.fn.executable('prettierd') > 0
            end,
        }),
        -- dprint
        null_ls.builtins.formatting.dprint.with({
            filetypes = { 'json', 'markdown', 'toml' },
            condition = function()
                return vim.fn.executable('dprint') > 0
            end,
        }),
        -- refactoring
        null_ls.builtins.code_actions.refactoring,
        -- eslint
        null_ls.builtins.diagnostics.eslint_d.with({
            condition = function()
                return vim.fn.executable('eslint_d') > 0
            end,
        }),
        null_ls.builtins.code_actions.eslint_d.with({
            condition = function()
                return vim.fn.executable('eslint_d') > 0
            end,
        }),
        null_ls.builtins.formatting.eslint_d.with({
            condition = function()
                return vim.fn.executable('eslint_d') > 0
            end,
        }),
        -- shellcheck
        null_ls.builtins.diagnostics.shellcheck.with({
            condition = function()
                return vim.fn.executable('shellcheck') > 0
            end,
        }),
        null_ls.builtins.code_actions.shellcheck.with({
            condition = function()
                return vim.fn.executable('shellcheck') > 0
            end,
        }),
        -- shellharden
        null_ls.builtins.formatting.shellharden.with({
            condition = function()
                return vim.fn.executable('shellharden') > 0
            end,
        }),
        -- shfmt
        null_ls.builtins.formatting.shfmt.with({
            condition = function()
                return vim.fn.executable('shfmt') > 0
            end,
            extra_args = { '-i', '2', '-ci', '-bn', '-sr' },
        }),
        -- yamllint
        null_ls.builtins.diagnostics.yamllint.with({
            condition = function()
                return vim.fn.executable('yamllint') > 0
            end,
        }),
        -- stylua
        null_ls.builtins.formatting.stylua.with({
            condition = function()
                return vim.fn.executable('stylua') > 0
            end,
        }),
        -- pylint
        null_ls.builtins.diagnostics.pylint.with({
            condition = function()
                return vim.fn.executable('pylint') > 0
            end,
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
            extra_args = { '--output-format', 'json' },
        }),
        -- black
        null_ls.builtins.formatting.black.with({
            condition = function()
                return vim.fn.executable('black') > 0
            end,
        }),
        -- isort
        null_ls.builtins.formatting.isort.with({
            condition = function()
                return vim.fn.executable('isort') > 0
            end,
        }),
        -- markdownlint
        null_ls.builtins.diagnostics.mdl.with({
            condition = function()
                return vim.fn.executable('mdl') > 0
            end,
        }),
        -- gitsigns
        null_ls.builtins.code_actions.gitsigns.with({
            condition = function()
                return vim.fn.executable('git') > 0
            end,
        }),
        -- gitrebase
        null_ls.builtins.code_actions.gitrebase.with({
            condition = function()
                return vim.fn.executable('git') > 0
            end,
        }),
        -- gitlint
        null_ls.builtins.diagnostics.gitlint.with({
            condition = function()
                return vim.fn.executable('gitlint') > 0
            end,
            cwd = function()
                -- Change runtime directory of gitlint to root of Git directory
                local job = require('plenary.job'):new({
                    command = 'git',
                    args = { 'rev-parse', '--show-toplevel' },
                })
                job:sync()
                return table.concat(job:result(), '\n')
            end,
        }),
        -- commitlint
        null_ls.builtins.diagnostics.commitlint.with({
            condition = function()
                return vim.fn.executable('commitlint') > 0
            end,
        }),
        null_ls.builtins.diagnostics.trail_space.with({
            disabled_filetypes = { 'NvimTree' },
        }),
        null_ls.builtins.formatting.trim_newlines.with({
            disabled_filetypes = { 'NvimTree' },
        }),
        null_ls.builtins.formatting.trim_whitespace.with({
            disabled_filetypes = { 'NvimTree' },
        }),
        -- vale
        null_ls.builtins.diagnostics.vale.with({
            condition = function()
                return vim.fn.executable('vale') > 0
            end,
        }),
    },
})
