local language = require('config.languages').lua
local cmp_util = require('utils.cmp')

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = 'Replace',
              },
              doc = {
                privateName = { '^_' },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = 'Disable',
                semicolon = 'Disable',
                arrayIndex = 'Disable',
              },
            },
          },
        },
        harper_ls = {
          filetypes = { 'lua' },
        },
      },
    },
  },
  {
    -- Nvim LSP
    'lazydev.nvim',
    ft = language.filetypes,
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        lazydev = '「VIM」',
      })
    end,
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = 'LazyVim', words = { 'LazyVim' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
        { path = 'lazy.nvim', words = { 'LazyVim' } },
        { path = 'dial.nvim' },
        { path = 'nvim-autopairs' },
        { path = 'nvim-treesitter' },
        { path = 'neoconf' },
      },
    },
  },
  {
    -- Completion for Nvim LSP
    'blink.cmp',
    opts = {
      sources = {
        per_filetype = {
          lua = cmp_util.sources('lua'),
        },
        providers = {
          lazydev = {
            name = 'lazydev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },
    },
  },
}
