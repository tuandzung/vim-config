---@diagnostic disable-next-line: unused-local
local language = require('config.languages').ipynb

return {
  {
    'sheng-tse/jupynvim',
    ft = language.filetypes,
    build = function(plugin)
      local install = loadfile(plugin.dir .. '/lua/jupynvim/install.lua')()
      install.run(plugin)
    end,
    keys = {
      {
        '<leader>jp',
        '<cmd>:edit<CR>',
        ft = language.filetypes,
        desc = 'Edit Notebook',
      },
    },
    config = function()
      require('jupynvim').setup({
        log_level = 'info',
        image_renderer = 'placeholder', -- "placeholder", "kitty", or "chafa"
      })
    end,
  },
}
