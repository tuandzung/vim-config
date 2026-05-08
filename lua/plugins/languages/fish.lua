local language = require('config.languages').fish
local cmp_util = require('utils.cmp')

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        fish_lsp = {},
      },
    },
  },
  {
    -- Completion
    'blink.cmp',
    dependencies = {
      'mtoohey31/cmp-fish',
      ft = language.filetypes,
      init = function()
        _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
          fish = '「FISH」',
        })
      end,
    },
    opts = {
      sources = {
        compat = { 'fish' },
        per_filetype = {
          fish = cmp_util.sources('fish'),
        },
      },
    },
  },
} or {}
