return {
  {
    'folke/snacks.nvim',
    opts = {
      indent = {
        enabled = true,
        char = '▎',
        animate = { enabled = false },
        indent = {
          only_current = false,
          only_scope = false,
        },
        scope = {
          enabled = true,
          only_current = true,
          only_scope = true,
          underline = false,
        },
        chunk = {
          enabled = true,
          only_current = true,
        },
        -- filter for buffers, turn off the indents for markdown
        filter = function(buf)
          return vim.g.snacks_indent ~= false
            and vim.b[buf].snacks_indent ~= false
            and vim.bo[buf].buftype == ''
            and vim.bo[buf].filetype ~= 'markdown'
        end,
      },
    },
  },
}
