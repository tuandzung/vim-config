---@diagnostic disable-next-line: unused-local
local language = require('config.languages').tilt

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tilt_ls = {},
      },
    },
  },
  {
    -- Filetype icons
    'nvim-mini/mini.icons',
    opts = {
      file = {
        ['Tiltfile'] = { glyph = '', hl = 'MiniIconsGreen' },
      },
    },
  },
} or {}
