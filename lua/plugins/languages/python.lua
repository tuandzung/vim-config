local language = require('config.languages').python
return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {},
        ruff = {},
        harper_ls = {},
      },
    },
  },
  {
    -- Test adapter
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-python',
      ft = language.filetypes,
    },
    opts = {
      adapters = {
        ['neotest-python'] = {
          dap = { justMyCode = false },
          runner = 'pytest',
        },
      },
    },
  },
}
