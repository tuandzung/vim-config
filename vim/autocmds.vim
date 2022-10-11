"Todo file
autocmd BufNewFile,BufRead *.todo set syntax=todo

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

" ++once supported in Nvim 0.4+ and Vim 8.1+
" autocmd CmdlineEnter * ++once call wilder#main#start()

autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()

augroup lsp
  au!
  au FileType java,scala,sbt lua require("metals").initialize_or_attach({})
augroup end

augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

autocmd FileType python lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("python"), {noremap = true})
autocmd FileType javascript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("js"), {noremap = true})
autocmd FileType typescript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("js"), {noremap = true})
autocmd FileType markdown lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("md"), {noremap = true})

autocmd FileType python,lua setlocal tabstop=4
autocmd FileType python,lua setlocal shiftwidth=4
