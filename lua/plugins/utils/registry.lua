return {
  {
    'mason-org/mason.nvim',
    opts = {
      -- Disable default tools
      ensure_installed = {},
      -- Add custom registries
      registries = {
        'lua:tools.mason-registry',
        'github:mason-org/mason-registry',
      },
    },
  },
}
