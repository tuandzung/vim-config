local language = require('config.languages').scala
return {
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        metals = {
          keys = {
            {
              '<leader>mf',
              function() require('metals').format() end,
              desc = 'Metals commands',
            },
            {
              '<leader>mc',
              function() require('metals').compile_cascade() end,
              desc = 'Metals compile cascade',
            },
            {
              '<leader>mh',
              function() require('metals').hover_worksheet() end,
              desc = 'Metals hover worksheet',
            },
          },
          init_options = {
            statusBarProvider = 'off',
          },
          capabilities = LazyVim.has('cmp-nvim-lsp') and require(
            'cmp_nvim_lsp'
          ).default_capabilities() or nil,
          settings = {
            showImplicitArguments = true,
            showImplicitConversionsAndClasses = true,
            showInferredType = true,
            superMethodLensesEnabled = true,
            excludedPackages = {
              'akka.actor.typed.javadsl',
              'com.github.swagger.akka.javadsl',
            },
          },
        },
      },
      setup = {
        metals = function(_, opts)
          local metals = require('metals')
          local metals_config =
            vim.tbl_deep_extend('force', metals.bare_config(), opts)
          metals_config.on_attach = LazyVim.has('nvim-dap') and metals.setup_dap
            or nil

          local nvim_metals_group =
            vim.api.nvim_create_augroup('nvim-metals', { clear = true })
          vim.api.nvim_create_autocmd('FileType', {
            pattern = language.filetypes,
            callback = function() metals.initialize_or_attach(metals_config) end,
            group = nvim_metals_group,
          })
          return true
        end,
      },
    },
  },
}
