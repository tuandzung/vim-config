require('bufferline').setup({
    options = {
        show_buffer_close_icons = false,
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        diagnostics_indicator = function(_, _, diagnostics_dict)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
                local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
                s = s .. sym .. n
            end
            return s
        end,
    },
})
