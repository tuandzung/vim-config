local present, spectre = pcall(require, 'spectre')

if not present then
    return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>S', ":lua require('spectre').open()<CR>", opts)

spectre.setup({})
