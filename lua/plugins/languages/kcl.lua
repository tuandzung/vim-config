---@diagnostic disable-next-line: unused-local
local language = require('config.languages').kcl

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        kcl = {},
      },
    },
  },
  {
    -- Filetype icons
    'nvim-mini/mini.icons',
    opts = {
      filetype = {
        kcl = { glyph = '󰬒', hl = 'MiniIconsBlue' },
      },
    },
  },
} or {}
