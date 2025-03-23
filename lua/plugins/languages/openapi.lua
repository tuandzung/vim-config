local language = require('config.languages').openapi

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        vacuum = {},
      },
    },
  },
}
