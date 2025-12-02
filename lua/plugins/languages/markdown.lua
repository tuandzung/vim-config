local language = require('config.languages').markdown

local _obsidian = {
  paths = {
    personal = vim.fn.expand("$HOME/Notes/Tuan Dzung's Second Brain"),
  },
}
local _obsidian_vaults = function()
  local result = {}
  for name, path in pairs(_obsidian.paths) do
    table.insert(result, {
      name = name,
      path = path,
    })
  end
  return result
end

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
    -- Linter config
    'mfussenegger/nvim-lint',
    opts = function()
      local lint = require('lint')
      lint.linters['markdownlint-cli2'].args = {
        '--config',
        '~/.config/markdownlint/config.yaml',
      }
    end,
  },
  {
    -- Obsidian
    'obsidian-nvim/obsidian.nvim',
    ft = language.filetypes,
    enabled = true,
    opts = {
      workspaces = _obsidian_vaults(),
      ui = { enable = false },
    },
    init = function()
      _G.completion_sources = vim.tbl_extend('force', _G.completion_sources, {
        obsidian = '「NOTE」',
      })
    end,
  },
  {
    -- Completion
    'blink.cmp',
    dependencies = { 'obsidian.nvim' },
    opts = {
      sources = {
        -- Not need to have compat for obsidian.nvim, because it is already handled in obsidian.nvim
        -- compat = { 'obsidian' },
        per_filetype = {
          markdown = {
            'lsp',
            'path',
            'project_path',
            'snippets',
            'buffer',
            'calc',
            'tmux',
            'emoji',
            'dynamic',
            'dictionary',
            'obsidian',
            'nerdfont',
          },
        },
      },
    },
  },
}
