require('catppuccin').setup({
    integration = {
        nvimtree = {
            enabled = true,
            transparent_panel = true,
            show_root = true,
        },
        which_key = true,
        neogit = true,
        indent_blankline = {
            colored_indent_levels = true
        },
        ts_rainbow = true,
    }
})

vim.cmd [[colorscheme catppuccin]]
