require('gitsigns').setup({
    signs = {
        add = { hl = 'GitSignsAdd', text = '█', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '█', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '█', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '█', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = {
            hl = 'GitSignsChange',
            text = '█',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn',
        },
    },
    preview_config = {
        border = 'rounded',
    },
    watch_gitdir = {
        interval = 100,
    },
    sign_priority = 6,
    status_formatter = nil, -- Use default
})
