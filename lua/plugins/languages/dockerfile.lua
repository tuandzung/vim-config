return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        dockerls = {},
      },
    },
  },
}
