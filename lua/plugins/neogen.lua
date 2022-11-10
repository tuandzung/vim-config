local present, neogen = pcall(require, 'neogen')

if not present then
    return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>nf', ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>nc', ":lua require('neogen').generate({ type = 'class' })<CR>", opts)

neogen.setup({
    snippet_engine = 'luasnip',
    languages = {
        python = {
            template = {
                annotation_convention = 'reST',
            },
        },
    },
})
