local opt = vim.opt
local g = vim.g

opt.guifont = 'Tepiosevka:h11' -- Font for GUI
opt.listchars = 'tab:→ ,trail:·,extends:↷,precedes:↶' -- Highlight unwanted space
opt.fileencoding = 'utf-8'
opt.fileformat = 'unix'
opt.modeline = true -- Accept modeline of each file
opt.modelines = 2
opt.backup = true -- Enable backup
opt.backupdir = vim.fn.stdpath('state') .. '/backup'
opt.showmatch = true -- Highlight matching parenthesis
opt.backspace = 'indent,eol,start' -- Flexible backspace
opt.mouse:remove('a') -- Not use mouse
opt.title = true -- Allow to change terminal's title
opt.autoread = true -- Automatically read a file changed outside of vim
opt.colorcolumn = '80,120' -- 80, 120 column chars line length
opt.wrap = true -- Set wrap mode

-- Persistent undo
-- Don't forget mkdir folder $HOME/.vim/undo
opt.undofile = true
opt.undodir = vim.fn.stdpath('state') .. '/undo'
opt.undolevels = 1000
opt.undoreload = 10000

-- Disable non-Lua provider
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0

g.os = vim.uv.os_uname().sysname
g.fps = vim.g.os == 'Darwin' and 120 or 144

require('config.filetypes')

-- Setup abbreviations
for abbr, full_text in pairs(require('config.defaults').abbreviations) do
  vim.cmd({ cmd = 'inoreabbrev', args = { abbr, full_text } })
end

-- Setup project config with `.nvim` folder in project root
vim.opt.rtp:append(require('lazyvim.util.root').get() .. '/.nvim')
