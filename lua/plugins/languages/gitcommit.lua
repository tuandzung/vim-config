local language = require('config.languages').gitcommit

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      harper_ls = {},
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'Kaiser-Yang/blink-cmp-git',
      ft = language.filetypes,
      init = function()
        _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
          Git = '「GIT」',
        })
      end,
    },
    opts = {
      sources = {
        -- add 'git' to the list
        default = {
          'git',
          'lsp',
          'snippets',
          'buffer',
          'dynamic',
          'dictionary',
        },
        providers = {
          git = {
            module = 'blink-cmp-git',
            opts = {},
          },
        },
      },
    },
  },
}
