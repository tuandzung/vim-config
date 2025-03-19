return {
  {
    {
      -- LSP config
      'neovim/nvim-lspconfig',
      opts = {
        servers = {
          bashls = {},
          harper_ls = {},
        },
      },
    },
  },
}
