-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFindFile<CR>', { noremap = true })

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup({
    view = {
        hide_root_folder = true,
    },
    renderer = {
        highlight_git = true,
        icons = {
            git_placement = 'after',
        },
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
})
