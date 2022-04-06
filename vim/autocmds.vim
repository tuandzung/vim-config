"Todo file
autocmd BufNewFile,BufRead *.todo set syntax=todo

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py.in lua vim.lsp.buf.formatting_sync(nil, 1000)

augroup lsp
  au!
  au FileType java,scala,sbt lua require("metals").initialize_or_attach({})
augroup end

autocmd FileType python lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("python"), {noremap = true})
autocmd FileType javascript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("js"), {noremap = true})
autocmd FileType typescript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("js"), {noremap = true})
autocmd FileType markdown lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("md"), {noremap = true})
