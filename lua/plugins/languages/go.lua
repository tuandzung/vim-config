local language = require('config.languages').go

return {
  {
    -- LSP config
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = {
                '-.git',
                '-.vscode',
                '-.idea',
                '-.vscode-test',
                '-node_modules',
              },
              semanticTokens = true,
            },
          },
        },
        harper_ls = {},
      },
      setup = {
        gopls = function(_, opts)
          -- workaround for gopls not supporting semanticTokensProvider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          LazyVim.lsp.on_attach(function(client, _)
            if not client.server_capabilities.semanticTokensProvider then
              local semantic =
                client.config.capabilities.textDocument.semanticTokens
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semantic.tokenTypes,
                  tokenModifiers = semantic.tokenModifiers,
                },
                range = true,
              }
            end
          end, 'gopls')
          -- end workaround
        end,
      },
    },
  },
  {
    -- Test adapter
    'nvim-neotest/neotest',
    dependencies = {
      'fredrikaverpil/neotest-golang',
      ft = language.filetypes,
    },
    opts = {
      adapters = {
        ['neotest-golang'] = {
          dap_go_enabled = true,
        },
      },
    },
  },
  {
    -- Filetype icons
    'echasnovski/mini.icons',
    opts = {
      file = {
        ['.go-version'] = { glyph = ' ', hl = 'MiniIconsBlue' },
      },
    },
  },
}
