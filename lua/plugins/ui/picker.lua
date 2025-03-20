return {
  {
    'folke/snacks.nvim',
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              '.git',
              'node_modules',
              '.yarn/cache',
              '.yarn/releases',
              '.pnpm-store',
              '.venv',
              'venv',
              '__pycache__',
              '.pytest_cache',
              '.ruff_cache',
            },
          },
          explorer = {
            diagnostics = false,
            hidden = true,
            ignored = true,
            exclude = {
              '.git',
              'node_modules',
              '.yarn/cache',
              '.yarn/releases',
              '.pnpm-store',
              '.venv',
              'venv',
              '__pycache__',
              '.pytest_cache',
              '.ruff_cache',
            },
            win = {
              list = {
                keys = {
                  ['<Esc>'] = '',
                  ['q'] = '',
                },
              },
            },
          },
        },
      },
    },
  },
}
