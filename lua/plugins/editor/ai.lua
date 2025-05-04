local chat_adapter = 'copilot'
local inline_adapter = 'copilot'
return {
  -- Codeium
  { import = 'lazyvim.plugins.extras.ai.codeium' },
  {
    -- AI Engine for coding
    'Exafunction/codeium.nvim',
    build = function()
      require('lazy').load({ plugins = { 'codeium.nvim' }, wait = true })
      vim.cmd(':Codeium Auth')
    end,
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        codeium = '「AI」',
      })
    end,
  },
  {
    -- AI Chat
    'olimorris/codecompanion.nvim',
    dependencies = {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function() require('copilot').setup({}) end,
    },
    cmd = { 'CodeCompanion', 'CodeCompanionChat' },
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        CodeCompanion = '「AI」',
      })
    end,
    opts = {
      adapters = {
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            env = {
              api_key = 'cmd: rbw get OpenAI',
            },
            schema = {
              model = {
                default = 'o4-mini',
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = vim.env.VIM_COMPANION_ADAPTER or chat_adapter or 'ollama',
        },
        inline = {
          adapter = vim.env.VIM_COMPANION_ADAPTER or inline_adapter or 'ollama',
        },
      },
    },
  },
}
