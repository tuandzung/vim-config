return {
  {
    'folke/snacks.nvim',
    opts = {
      scroll = {
        animate = {
          duration = { total = 100 },
          easing = 'inOutExpo',
          fps = vim.g.fps,
        },
      },
    },
  },
}
