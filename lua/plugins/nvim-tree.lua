-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFindFile<CR>', { noremap = true })

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup({
    hijack_cursor = true,
    sync_root_with_cwd = true,
    view = {
        adaptive_size = false,
    },
    renderer = {
        full_name = true,
        group_empty = true,
        highlight_git = true,
        icons = {
            git_placement = 'signcolumn',
            glyphs = {
                git = {
                    unstaged = '',
                    staged = '',
                    untracked = '',
                    ignored = '',
                },
            },
        },
        indent_markers = {
            enable = true,
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { 'help' },
    },
    actions = {
        change_dir = {
            enable = false,
            restrict_above_cwd = true,
        },
        open_file = {
            resize_window = true,
            window_picker = {
                chars = 'aoeui',
            },
        },
        remove_file = {
            close_window = false,
        },
    },
    filters = {
        custom = { '^.git$' },
    },
})
