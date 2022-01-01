-- Install plugins
-- To add new plugins, use the "install_plugins" hook,

local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
    use {
        "williamboman/nvim-lsp-installer",
        config = function()
            local lsp_installer = require "nvim-lsp-installer"

            lsp_installer.on_server_ready(function(server)
                local opts = {}

                server:setup(opts)
                vim.cmd [[ do User LspAttachBuffers ]]
            end)
        end,
    }

    -- use {
    --     "nvim-treesitter/nvim-treesitter",
    --     run = ':TSUpdate',
    -- }
    --
    -- 历史修改记录
    use {
        "mbbill/undotree",
        opt = true,
        cmd = "UndotreeToggle",
    }

    -- 函数列表
    use {
        "liuchengxu/vista.vim",
        cmd = "Vista",
    }

    -- 格式化
    use {
        "Chiel92/vim-autoformat",
        cmd = "Autoformat",
    }

    -- 快速分析启动时间
    use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    }

    -- 现代任务系统
    use {
        "skywind3000/asynctasks.vim",
        requires = "skywind3000/asyncrun.vim",
        cmd = {"AsyncTask", "AsyncTaskEdit"},
    }

    -- focus
    use {
        "Pocco81/TrueZen.nvim",
        cmd = {
            "TZAtaraxis",
            "TZMinimalist",
            "TZFocus",
        },
        config = function()
            -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
        end
    }

    -- stabilize windows open/close events
    use {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }

    -- auto save
    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            local autosave = require "autosave"

            autosave.setup {
                enabled = true,
                execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
                events = { "InsertLeave", "TextChanged" },
                conditions = {
                    exists = true,
                    filetype_is_not = {},
                    modifiable = true,
                },
                clean_command_line_interval = 2500,
                on_off_commands = true,
                write_all_buffers = false,
            }
        end,
    }

end)

