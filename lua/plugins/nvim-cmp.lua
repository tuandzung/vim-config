local cmp = require('cmp')
local types = require('cmp.types')
local str = require('cmp.utils.str')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            scrollbar = "║",
        },
    },
    formatting = {
        fields = {
            cmp.ItemField.Kind,
            cmp.ItemField.Abbr,
            cmp.ItemField.Menu,
        },
        format = lspkind.cmp_format({
            with_text = false,
            before = function(entry, vim_item)
                -- Get the full snippet (and only keep first line)
                local word = entry:get_insert_text()
                if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                    word = vim.lsp.util.parse_snippet(word)
                end
                word = str.oneline(word)

                -- concatenates the string
                -- local max = 50
                -- if string.len(word) >= max then
                -- 	local before = string.sub(word, 1, math.floor((max - 3) / 2))
                -- 	word = before .. "..."
                -- end

                if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
                    and string.sub(vim_item.abbr, -1, -1) == "~"
                then
                    word = word .. "~"
                end
                vim_item.abbr = word

                return vim_item
            end,
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-?>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = "buffer", keyword_length = 5, max_item_count = 5 },
        { name = "orgmode" }
    }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline', keyword_length = 2 },
    }),
})
