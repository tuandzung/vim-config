return {
  {
    'Davidyz/VectorCode', -- Index and search code in your repositories
    version = '*',
    build = 'uv tool upgrade vectorcode',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'VectorCode',
  },
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
        supermaven = '「Supermaven」',
      })
    end,
  },
  -- Minuet
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('vectorcode').setup({
        -- number of retrieved documents
        n_query = 1,
      })
      local has_vc, vectorcode_config = pcall(require, 'vectorcode.config')
      local vectorcode_cacher = nil
      if has_vc then
        vectorcode_cacher = vectorcode_config.get_cacher_backend()
      end

      -- roughly equate to 2000 tokens for LLM
      local RAG_Context_Window_Size = 8000

      require('minuet').setup({
        provider = 'openai_fim_compatible',
        n_completions = 1, -- recommend for local model for resource saving
        -- I recommend beginning with a small context window size and incrementally
        -- expanding it, depending on your local computing power. A context window
        -- of 512, serves as an good starting point to estimate your computing
        -- power. Once you have a reliable estimate of your local computing power,
        -- you should adjust the context window to a larger value.
        context_window = 65536,
        provider_options = {
          openai_fim_compatible = {
            -- For Windows users, TERM may not be present in environment variables.
            -- Consider using APPDATA instead.
            api_key = 'LLAMA_API_KEY',
            name = 'llama.cpp',
            end_point = 'http://192.168.2.32:8001/v1/completions',
            model = 'PLACEHOLDER',
            -- Llama.cpp does not support the `suffix` option in FIM completion.
            -- Therefore, we must disable it and manually populate the special
            -- tokens required for FIM completion.
            template = {
              prompt = function(
                context_before_cursor,
                context_after_cursor,
                _
              )
                return '<|fim_prefix|>'
                  .. context_before_cursor
                  .. '<|fim_suffix|>'
                  .. context_after_cursor
                  .. '<|fim_middle|>'
              end,
              suffix = false,
            },
          },
        },
      })
    end,
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        minuet = '「Minuet」',
      })
    end,
  },
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      keymap = {
        ['<A-y>'] = {
          function(cmp) cmp.show({ providers = { 'minuet' } }) end,
        },
      },
      sources = {
        -- if you want to use auto-complete
        default = { 'minuet' },
        providers = {
          minuet = {
            name = 'minuet',
            module = 'minuet.blink',
            score_offset = 100,
          },
        },
      },
    },
  },
  -- AI CLI
  { import = 'lazyvim.plugins.extras.ai.sidekick' },
}
