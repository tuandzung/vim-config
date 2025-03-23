local language = require('config.languages').latex

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        ltex = {},
        texlab = {},
      },
    },
  },
}
