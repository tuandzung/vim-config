return {
  { 'echasnovski/mini.pairs', enabled = false }, -- Disable mini.pairs from LazyVim
  {
    -- Automatically insert/delete brackets, parentheses, quotes...
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true, -- Check grammar by TreeSitter
      enable_abbr = true, -- Enable abbreviation
      fast_wrap = {}, -- Use default FastWrap
    },
  },
  {
    -- Accept auto brackets from autopairs for completion
    'saghen/blink.cmp',
    opts = {
      completion = { accept = { auto_brackets = { enabled = true } } },
    },
  },
}
