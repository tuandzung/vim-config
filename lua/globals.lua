local vim = vim
local global = vim.g
local env = vim.env

-- Ignore for indent levels
global.indent_blankline_filetype_exclude = {
    'help',
    'packer',
    'nvim-tree',
}

global.is_posix = 1
global.mapleader = ' '

-- Vim color highlighting
global.Hexokinase_highlighters = { 'virtual' }
global.Hexokinase_virtualText = '▩'

-- Go syntax highlighting
global.go_highlight_fields = 1
global.go_highlight_functions = 1
global.go_highlight_function_calls = 1
global.go_highlight_extra_types = 1
global.go_highlight_operators = 1

-- Auto formatting and importing
global.go_fmt_autosave = 1
global.go_fmt_command = 'goimports'

-- Status line types/signatures
global.go_auto_type_info = 1

global.NERDSpaceDelims = 1

global.glow_border = 'rounded'
