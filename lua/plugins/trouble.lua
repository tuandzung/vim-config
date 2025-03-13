require('trouble').setup(
    {
        modes = {
            mydiags = {
                mode = "diagnostics", -- inherit from diagnostics mode
                filter = {
                    any = {
                        buf = 0,                          -- current buffer
                        {
                            severity = vim.diagnostic.severity.ERROR, -- errors only
                            -- limit to files in the current project
                            function(item)
                                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                            end,
                        },
                    },
                },
            }
        }
    }
)
