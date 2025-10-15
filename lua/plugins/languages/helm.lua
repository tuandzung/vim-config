local language = require('config.languages').helm

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        helm_ls = {},
      },
    },
  },
  {
    -- Filetype icons
    'nvim-mini/mini.icons',
    opts = {
      filetype = {
        helm = { glyph = '', hl = 'MiniIconsGrey' },
      },
    },
  },
}
