-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1 }
vim.g.nvim_tree_icons = {
    default = '',
}
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFindFile<CR>', { noremap = true })

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup({
    actions = {
        open_file = {
            resize_window = true,
        },
    }
})
