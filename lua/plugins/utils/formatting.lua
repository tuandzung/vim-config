return {
  {
    -- Formatters
    'stevearc/conform.nvim',
    opts = function(_, opts)
      for name, language in pairs(require('config.languages')) do
        for _, ft in ipairs(language.filetypes) do
          opts.formatters_by_ft[ft] = {}
          for _, tool in ipairs(language.formatters or {}) do
            local tool_name, tool_command
            -- Add formatter's config to list of tools if exist
            if type(tool) == 'string' then
              tool_name = tool
              tool_command = tool
            elseif type(tool) == 'table' then
              tool_name = tool[1]
              tool_command = tool.command or tool_name
              if tool.opts then
                opts.formatters[tool_name] = vim.tbl_extend(
                  'force',
                  opts.formatters[tool_name] or {},
                  tool.opts
                )
              end
            end
            if
              vim.fn.executable(tool_command) == 1
              or name == '*'
              or tool_name == 'injected'
            then
              table.insert(opts.formatters_by_ft[ft], tool_name)
            end
          end
        end
      end
    end,
  },
  { -- Assuming you init/setup snacks.nvim in a different file
    'folke/snacks.nvim',
    opts = function()
      vim.g.autoformat = true -- Sets up the default value to be true
      Snacks.toggle
        .new({
          id = 'Format on Save',
          name = 'Format on Save',
          get = function() return vim.g.autoformat end,
          set = function(_) vim.g.autoformat = not vim.g.autoformat end,
        })
        :map('<leader>uf')
    end,
  },
  {
    -- Auto install formatters
    'williamboman/mason.nvim',
    opts = function(_, opts)
      for name, language in pairs(require('config.languages')) do
        for _, tool in ipairs(language.formatters or {}) do
          local tool_package
          local is_mason_tool = true
          if type(tool) == 'string' then
            tool_package = tool
          elseif type(tool) == 'table' then
            if tool.mason then is_mason_tool = tool.mason.enabled ~= false end
            tool_package = tool.command
              or (tool.mason and tool.mason.package or tool[1])
          end
          if is_mason_tool then
            -- install server of language in bundle languages
            table.insert(opts.ensure_installed, tool_package)
            -- lazy install server of language not in bundle languages
            vim.api.nvim_create_autocmd({ 'FileType' }, {
              pattern = language.filetypes,
              group = vim.api.nvim_create_augroup(
                'mason_formatter_' .. name .. '_' .. tool_package,
                {}
              ),
              callback = function()
                local registry = require('mason-registry')
                if not registry.is_installed(tool_package) then
                  vim.api.nvim_command('MasonInstall ' .. tool_package)
                end
              end,
            })
          end
        end
      end
    end,
  },
}
