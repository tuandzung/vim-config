local language = require('config.languages').gitcommit
local cmp_util = require('utils.cmp')

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
        per_filetype = {
          gitcommit = cmp_util.sources('gitcommit'),
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
