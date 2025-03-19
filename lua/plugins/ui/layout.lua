return {
  {
    -- Improve messages, cmdline, popups & LSP
    'folke/noice.nvim',
    opts = {
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
              { find = 'Choose type .* to import' }, -- jdtls organize imports
            },
          },
          view = 'mini',
        },
      },
      cmdline = {
        view = 'cmdline',
        format = {
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
        },
      },
      popupmenu = {
        enabled = false,
      },
      views = {
        mini = { win_options = { winblend = 0 } },
      },
    },
  },
  -- Windows layout
  { import = 'lazyvim.plugins.extras.ui.edgy' },
}
