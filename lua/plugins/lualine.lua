local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local present, gps = pcall(require, 'nvim-gps')
local gps_component = nil
if present then
    gps_component = {
        gps.get_location,
        cond = gps.is_available,
    }
end

local hide_in_narrow_panes = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn', 'info', 'hint' },
    colored = true,
    update_in_insert = false,
    always_visible = true,
    cond = hide_in_narrow_panes,
}

local diff = {
    'diff',
    colored = true,
    symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
    cond = hide_in_narrow_panes,
}

local mode = {
    'mode',
    icon = '邏',
}

local filetype = {
    'filetype',
    colored = true,
    icon_only = true,
    padding = { left = 1, right = 0 },
    component_separators = { right = '' },
}

local filename = {
    'filename',
    padding = { left = 1, right = 1 },
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
    cond = hide_in_narrow_panes,
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'dashboard', 'Outline' },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { diagnostics, gps_component },
        lualine_x = { diff },
        lualine_y = {
            {
                function()
                    local msg = 'None'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = '',
                color = { fg = '#ffffff', gui = 'bold' },
            },
            filetype,
            filename,
        },
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { diff },
        lualine_y = { filetype, filename },
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
