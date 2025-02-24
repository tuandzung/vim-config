local cmd = vim.cmd
local vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('lazy').setup({
    'nvim-lua/plenary.nvim',
    'nathom/filetype.nvim',
    'lewis6991/impatient.nvim',
    'dstein64/vim-startuptime',
    'gelguy/wilder.nvim',

    {
        'projekt0n/github-nvim-theme',
        branch = 'main',
    },

    {
        'catppuccin/nvim',
        as = 'catppuccin',
    },

    'kyazdani42/nvim-web-devicons',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'akinsho/nvim-bufferline.lua',
        branch = 'main',
    },

    {
        'folke/trouble.nvim',
        branch = 'main',
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        branch = 'master',
    },
    'RRethy/nvim-treesitter-endwise',

    'kyazdani42/nvim-tree.lua',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        branch = 'main',
        build = 'make',
    },
    'jiangmiao/auto-pairs',
    {
        'lewis6991/gitsigns.nvim',
        branch = 'main',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'folke/which-key.nvim',
        branch = 'main',
    },
    {
        'folke/todo-comments.nvim',
        branch = 'main',
    },
    'numToStr/Comment.nvim',
    {
        'p00f/nvim-ts-rainbow',
        branch = 'master',
    },
    'lukas-reineke/indent-blankline.nvim',
    'ntpeters/vim-better-whitespace',
    'gpanders/editorconfig.nvim',
    'ur4ltz/surround.nvim',
    'haya14busa/incsearch.vim',
    'scrooloose/nerdcommenter',
    'mhinz/vim-startify',
    'machakann/vim-highlightedyank',
    {
        'hrsh7th/nvim-cmp',
        branch = 'main',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    },
    {
        'danymat/neogen',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    },
    'sheerun/vim-polyglot',
    'chrisbra/csv.vim',
    'ellisonleao/glow.nvim',
    {
        'scalameta/nvim-metals',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'karb94/neoscroll.nvim',
    {
        'akinsho/toggleterm.nvim',
        branch = 'main',
    },
    'norcalli/nvim-colorizer.lua',
    {
        'SmiteshP/nvim-navic',
    },
    'ethanholz/nvim-lastplace',
    'williamboman/nvim-lsp-installer',
    { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
    { 'monaqa/dial.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { -- Browser
        'glacambre/firenvim',
        build = function()
            vim.fn['firenvim#install'](0)
        end,
    },
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { 'anuvyklack/pretty-fold.nvim', dependencies = { 'anuvyklack/nvim-keymap-amend' } },
    'Xuyuanp/scrollbar.nvim',
    'onsails/lspkind.nvim',
    {
        'nvim-orgmode/orgmode',
        dependencies = 'nvim-treesitter',
    },
    'ThePrimeagen/refactoring.nvim',
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
    },
    'rmagatti/goto-preview',
    'windwp/nvim-spectre',
})
