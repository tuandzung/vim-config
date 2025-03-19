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
