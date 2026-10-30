local language = require('config.languages').markdown
local cmp_util = require('utils.cmp')

local _obsidian = {
  paths = {
    -- vim.fn.expand() leaves paths containing `'` unexpanded
    personal = vim.fs.normalize("$HOME/Notes/Tuan Dzung's Second Brain"),
  },
}
-- Only vaults present on this machine
local _obsidian_vaults = {}
local _obsidian_patterns = {}
for name, path in pairs(_obsidian.paths) do
  if vim.uv.fs_stat(path) then
    table.insert(_obsidian_vaults, { name = name, path = path })
    -- `*` in autocmd patterns also matches `/`, so this covers nested notes
    table.insert(_obsidian_patterns, path .. '/*.md')
  end
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
    -- Load only for notes inside an existing vault (BufReadPre fires before
    -- FileType, which obsidian.nvim needs to attach to the first note)
    event = {
      { event = 'BufReadPre', pattern = _obsidian_patterns },
      { event = 'BufNewFile', pattern = _obsidian_patterns },
    },
    cmd = 'Obsidian',
    cond = #_obsidian_vaults > 0,
    opts = {
      workspaces = _obsidian_vaults,
      ui = { enable = false },
      legacy_commands = false,
    },
  },
  {
    -- Completion
    'blink.cmp',
    opts = {
      sources = {
        per_filetype = {
          markdown = cmp_util.sources('markdown'),
        },
      },
    },
  },
}
