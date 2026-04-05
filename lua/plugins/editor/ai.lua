return {
  {
    'Davidyz/VectorCode', -- Index and search code in your repositories
    version = '*',
    build = 'uv tool upgrade vectorcode',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'VectorCode',
  },
  {
    -- Copilot with native LSP
    import = 'lazyvim.plugins.extras.ai.copilot-native',
    enabled = vim.fn.has('nvim-0.12.0') == 1,
  },
  -- AI CLI
  { import = 'lazyvim.plugins.extras.ai.sidekick' },
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      keymap = {
        ['<A-y>'] = {
          function(cmp) cmp.show({ providers = { 'minuet' } }) end,
        },
      },
      sources = {
        -- if you want to use auto-complete
        default = { 'minuet' },
        providers = {
          minuet = {
            name = 'minuet',
            module = 'minuet.blink',
            score_offset = 100,
          },
        },
      },
    },
  },
}
