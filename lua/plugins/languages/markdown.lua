local language = require('config.languages').markdown

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { 'markdown' },
        },
        marksman = {},
        vale_ls = {},
        harper_ls = {},
      },
    },
  },
  {
    -- Preview markdown
    'toppair/peek.nvim',
    ft = language.filetypes,
    build = 'deno task --quiet build:fast',
    enabled = vim.fn.executable('deno') == 1,
    keys = {
      {
        '<leader>cp',
        function() require('peek').open() end,
        ft = language.filetypes,
        desc = 'Markdown Preview',
      },
    },
    opts = {
      app = 'browser',
    },
  },
  {
    -- Linter config
    'mfussenegger/nvim-lint',
    opts = function()
      local lint = require('lint')
      lint.linters['markdownlint-cli2'].args = {
        '--config',
        '~/.config/markdownlint/config.yaml',
      }
    end,
  },
}
