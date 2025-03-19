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
