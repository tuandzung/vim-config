local vim = vim
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.showmode = false
opt.joinspaces = false
opt.wrap = false
opt.updatetime = 100
opt.encoding = 'UTF-8'
opt.hidden = true
opt.mouse = 'a' -- enable mouse for all mode
opt.cursorline = true
opt.foldmethod = 'indent'
opt.foldlevel = 99
opt.showtabline = 2

opt.number = true
opt.ttyfast = true
opt.laststatus = 2
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.termguicolors = true
opt.ignorecase = true
opt.relativenumber = true

opt.autowrite = true

if fn.has('multi_byte') == 1 then
  opt.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  opt.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:~]]
end

opt.list = true

opt.backspace = {'eol', 'start', 'indent'}
opt.whichwrap:append("<>hl")

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

-- Persistent undo
-- Don't forget mkdir folder $HOME/.vim/undo
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo'
opt.undolevels = 1000
opt.undoreload = 10000

opt.wildoptions = 'pum'
opt.pumblend = 1

opt.clipboard = 'unnamedplus'
opt.shortmess:append('c')
opt.signcolumn = 'yes'
