require('filetype').setup({
    overrides = {
        extensions = {
            envrc = 'sh',
        },
        complex = {
            ['.git/ignore'] = 'gitignore',
        },
    },
})
