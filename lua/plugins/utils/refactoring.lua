return {
  -- Refactoring
  { import = 'lazyvim.plugins.extras.editor.refactoring' },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'lewis6991/async.nvim',
    },
    lazy = false,
  },
}
