return {
  {
    -- Completion
    'blink.cmp',
    dependencies = { 'Kaiser-Yang/blink-cmp-git' },
    opts = {
      sources = {
        -- add 'git' to the list
        default = {
          'git',
          'lsp',
          'snippets',
          'buffer',
          'dynamic',
          'dictionary',
        },
        providers = {
          git = {
            module = 'blink-cmp-git',
            opts = {},
          },
        },
      },
    },
  },
}
