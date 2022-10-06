local cmd = vim.cmd

cmd('packadd packer.nvim')

local present, packer = pcall(require, 'packer')

if not present then
    local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

    print('Cloning packer..')
    -- remove the dir before cloning
    vim.fn.delete(packer_path, 'rf')
    vim.fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        '--depth',
        '20',
        packer_path,
    })

    cmd('packadd packer.nvim')
    present, packer = pcall(require, 'packer')

    if present then
        print('Packer cloned successfully.')
    else
        error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
    end
end

packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end,
        prompt_border = 'single',
    },
    git = {
        clone_timeout = 600, -- Timeout, in seconds, for git clones
    },
    auto_clean = true,
    compile_on_sync = true,
    --    auto_reload_compiled = true
})

local vim = vim
require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')
    use('nathom/filetype.nvim')
    use('lewis6991/impatient.nvim')
    use('dstein64/vim-startuptime')
    use('gelguy/wilder.nvim')

    use({
        'projekt0n/github-nvim-theme',
        branch = 'main',
    })

    use({
        'catppuccin/nvim',
        as = 'catppuccin'
    })

    use('kyazdani42/nvim-web-devicons')

    use({
        'nvim-lualine/lualine.nvim'
    })
    use({
        'akinsho/nvim-bufferline.lua',
        branch = 'main',
    })

    use({
        'folke/trouble.nvim',
        branch = 'main',
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        branch = 'master',
    })
    use('RRethy/nvim-treesitter-endwise')

    use('kyazdani42/nvim-tree.lua')
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    })
    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        branch = 'main',
        run = 'make',
    })
    use('jiangmiao/auto-pairs')
    use({
        'lewis6991/gitsigns.nvim',
        branch = 'main',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    })
    use({
        'folke/which-key.nvim',
        branch = 'main',
    })
    use({
        'folke/todo-comments.nvim',
        branch = 'main',
    })
    use('numToStr/Comment.nvim')
    use({
        'p00f/nvim-ts-rainbow',
        branch = 'master',
    })
    use('lukas-reineke/indent-blankline.nvim')
    use('ntpeters/vim-better-whitespace')
    use('gpanders/editorconfig.nvim')
    use('ur4ltz/surround.nvim')
    use('haya14busa/incsearch.vim')
    use('scrooloose/nerdcommenter')
    use('mhinz/vim-startify')
    use('machakann/vim-highlightedyank')
    use({
        'hrsh7th/nvim-cmp',
        branch = 'main',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    })
    use('sheerun/vim-polyglot')
    use('chrisbra/csv.vim')
    use('ellisonleao/glow.nvim')
    use({
        'scalameta/nvim-metals',
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use('karb94/neoscroll.nvim')
    use({
        'akinsho/toggleterm.nvim',
        branch = 'main',
    })
    use('norcalli/nvim-colorizer.lua')
    use({
        'SmiteshP/nvim-navic',
    })
    use('ethanholz/nvim-lastplace')
    use('williamboman/nvim-lsp-installer')
    use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })
    use({ 'monaqa/dial.nvim', requires = 'nvim-lua/plenary.nvim' })
    use({ -- Browser
        'glacambre/firenvim',
        run = function()
            vim.fn['firenvim#install'](0)
        end,
    })
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
    use({ 'anuvyklack/pretty-fold.nvim', requires = { 'anuvyklack/nvim-keymap-amend' } })
    use('Xuyuanp/scrollbar.nvim')
    use('onsails/lspkind.nvim')
    use({
        'nvim-orgmode/orgmode', after = 'nvim-treesitter'
    })
    use({
        'xeluxee/competitest.nvim',
        requires = 'MunifTanjim/nui.nvim',
    })
end)
