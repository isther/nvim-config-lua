-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
    theme = "tokyonight",
    italic_comments = true,
}

M.options = {
    ts = 4,
    softtabstop = 4,
    shiftwidth = 4,
}

M.plugins = {
    status = {
        colorizer = true,
        dashboard = true,
        telescope_media = true,
    },
    options = {
        lspconfig = {
            setup_lspconf = "custom.configs.lsp-config",
        },
        nvimtree = {
            ui = {
                side = "right",
                hide_root_folder = false,
            },
        },
        statusline = {
            shown = {
                "help",
                "dashboard",
                "Nvimtree",
                "terminal",
            },
        },
    },
    default_plugin_config_replace = {
        dashboard = "custom.configs.dashboard",
    },
}

return M
