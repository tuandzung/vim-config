---@diagnostic disable-next-line: unused-local
local language = require('config.languages').gitrebase
local cmp_util = require('utils.cmp')
return {
  {
    -- Completion
    'blink.cmp',
    dependencies = { 'Kaiser-Yang/blink-cmp-git' },
    opts = {
      sources = {
        -- add 'git' to the list
        per_filetype = {
          gitrebase = cmp_util.sources('gitrebase'),
        },
        providers = {
          git = {
            module = 'blink-cmp-git',
            opts = {},
          },
        },
      },
    },
  },
}
