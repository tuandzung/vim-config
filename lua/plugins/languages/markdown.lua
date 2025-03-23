local language = require('config.languages').markdown

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { 'markdown' },
        },
        marksman = {},
        vale_ls = {},
        harper_ls = {},
      },
    },
  },
  {
    -- Preview markdown
    'toppair/peek.nvim',
    ft = language.filetypes,
    build = 'deno task --quiet build:fast',
    enabled = vim.fn.executable('deno') == 1,
    keys = {
      {
        '<leader>cp',
        function() require('peek').open() end,
        ft = language.filetypes,
        desc = 'Markdown Preview',
      },
    },
    opts = {
      app = 'browser',
    },
  },
  {
    -- Highlight for headlines, codeblocks
    'MeanderingProgrammer/render-markdown.nvim',
    ft = language.filetypes,
    opts = {
      code = {
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)
      Snacks.toggle({
        name = 'Render Markdown',
        get = function() return require('render-markdown.state').enabled end,
        set = function(enabled)
          local m = require('render-markdown')
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map('<leader>um')
    end,
  },
}
