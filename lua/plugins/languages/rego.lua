---@diagnostic disable-next-line: unused-local
local language = require('config.languages').rego

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        regal = {},
      },
    },
  },
}
