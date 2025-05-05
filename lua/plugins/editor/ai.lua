local config = require('config.ai')
local current_model = config.available_models[1] -- Consider if you need this variable anymore or how it should be used

local function select_model()
  vim.ui.select(config.available_models, {
    prompt = 'Select Model:',
  }, function(choice)
    if choice then
      current_model = choice -- Update the model if needed elsewhere
      vim.notify('Selected model: ' .. current_model)
    end
  end)
end

return {
  -- Supermaven
  { import = 'lazyvim.plugins.extras.ai.supermaven' },
  {
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    cmd = {
      'SupermavenUseFree',
      'SupermavenUsePro',
    },
    opts = {
      keymaps = {
        accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
      },
      disable_inline_completion = vim.g.ai_cmp,
      ignore_filetypes = { 'bigfile', 'snacks_input', 'snacks_notif' },
    },
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        supermaven = '「AI」',
      })
    end,
  },
  {
    -- AI Chat
    'olimorris/codecompanion.nvim',
    dependencies = {
      'j-hui/fidget.nvim',
      {
        'ravitemer/mcphub.nvim', -- Manage MCP servers
        cmd = 'MCPHub',
        build = 'npm install -g mcp-hub@latest',
        config = true,
      },
      {
        'Davidyz/VectorCode', -- Index and search code in your repositories
        version = '*',
        build = 'uv tool install vectorcode',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
    cmd = { 'CodeCompanion', 'CodeCompanionChat' },
    keys = {
      -- Define the keymap here using the 'keys' table
      {
        '<leader>og',
        select_model, -- Use the function defined above
        desc = 'Select OpenRouter Model',
        mode = 'n', -- Specify the mode
      },
      -- You could potentially add more keys here that should load the plugin
      {
        '<C-a>',
        '<cmd>CodeCompanionActions<CR>',
        desc = 'Open the action palette',
        mode = { 'n', 'v' },
      },
      {
        '<Leader>a',
        '<cmd>CodeCompanionChat Toggle<CR>',
        desc = 'Toggle a chat buffer',
        mode = { 'n', 'v' },
      },
      {
        '<LocalLeader>a',
        '<cmd>CodeCompanionChat Add<CR>',
        desc = 'Add code to a chat buffer',
        mode = { 'v' },
      },
    },
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        CodeCompanion = '「AI」',
      })
      require('plugins.others.spinner'):init()
    end,
    config = function()
      require('codecompanion').setup({
        extensions = {
          mcphub = {
            callback = function()
              return require('mcphub.extensions.codecompanion')
            end,
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
          vectorcode = {
            opts = {
              add_tool = true,
            },
          },
        },
        adapters = {
          openrouter = function()
            return require('codecompanion.adapters').extend(
              'openai_compatible',
              {
                env = {
                  url = 'https://openrouter.ai/api',
                  api_key = 'cmd: rbw get OpenRouter',
                  chat_url = '/v1/chat/completions',
                },
                schema = {
                  model = {
                    default = current_model,
                  },
                },
              }
            )
          end,
        },
        strategies = {
          chat = {
            roles = {
              user = 'tuandzung',
            },
            adapter = vim.env.VIM_COMPANION_ADAPTER
              or config.chat_adapter
              or 'ollama',
            tools = {
              opts = {
                auto_submit_success = false,
                auto_submit_errors = false,
              },
            },
          },
          inline = {
            adapter = vim.env.VIM_COMPANION_ADAPTER
              or config.inline_adapter
              or 'ollama',
          },
        },
        slash_commands = {
          ['buffer'] = {
            opts = {
              keymaps = {
                modes = {
                  i = '<C-b>',
                },
              },
            },
          },
          ['help'] = {
            opts = {
              max_lines = 1000,
            },
          },
        },
        display = {
          action_palette = {
            provider = 'default',
          },
          chat = {
            show_references = true,
            show_header_separator = false,
            show_settings = false,
          },
          diff = {
            provider = 'mini_diff',
          },
        },
      })
    end,
  },
}
