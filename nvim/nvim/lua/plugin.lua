-- ====================
-- lazy
-- ====================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo(
            { { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." } },
            true,
            {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            -- ## ダッシュボード設定
            "nvimdev/dashboard-nvim",
            event = "VimEnter",
            config = function()
                require("dashboard").setup({
                    theme = "hyper",
                    letter_list = "abcdefgmnopqrstuvwxyz",
                    config = {
                        header = {
                            "                                                  ",
                            "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
                            "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
                            "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
                            "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                            "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
                            "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
                            "                                                  ",
                        },
                        shortcut = {
                            {
                                desc = "new file",
                                group = "@variable",
                                key = "i",
                                action = "enew",
                            },
                        },
                        disable_move = true,
                    },
                })
            end,
            dependencies = { { "nvim-tree/nvim-web-devicons" } },
        },
        {
            -- ## Lualine
            "nvim-lualine/lualine.nvim",
            config = function()
                require("lualine").setup({
                    options = {
                        theme = "onedark",
                    },
                })
            end,
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
            -- ## インデント表示
            "shellRaining/hlchunk.nvim",
            event = { "BufReadPre", "BufNewFile" },
            config = function()
                require("hlchunk").setup({
                    chunk = {
                        enable = true,
                    },
                    indent = {
                        enable = true,
                        chars = { "│", "¦", "┆", "┊" },
                    },
                })
            end,
        },
        {
            -- ## theme
            "EdenEast/nightfox.nvim",
            config = function()
                vim.cmd.colorscheme("nightfox")
            end,
        },
        {
            -- ## タブ
            "romgrk/barbar.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            init = function()
                vim.g.barbar_auto_setup = false
            end,
            opts = {},
        },
        { "petertriho/nvim-scrollbar" },
        { "kevinhwang91/nvim-hlslens" },
        { "lewis6991/gitsigns.nvim" },
        {
            -- ## フォーマット
            "stevearc/conform.nvim",
            event = { "BufWritePre" },
            cmd = { "ConformInfo" },
            keys = {
                {
                    "<leader>f",
                    function()
                        require("conform").format({
                            async = true,
                        })
                    end,
                    mode = "",
                    desc = "Format buffer",
                },
            },
            opts = {
                -- フォーマッタ
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = {
                        "prettierd",
                        "prettier",
                        stop_after_first = true,
                    },
                },
                default_format_opts = {
                    lsp_format = "fallback",
                },
            },
        },
        { "RRethy/vim-illuminate" },
        {
            -- ## ファジーファインダー
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("telescope")
            end,
        },
        {
            -- ## ファイルツリー
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "nvim-tree/nvim-web-devicons",
            },
            lazy = false, -- neo-tree will lazily load itself
        },
        {
            -- ## LSPコンフィグ
            "neovim/nvim-lspconfig",
            event = { "BufReadPre", "BufNewFile" },
        },
        {
            -- ## LSPマネージャ(Mason)
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },
        {
            -- ## LS自動インストール
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "lua_ls",
                    "powershell_es",
                },
            },
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
        },
    },

    -- カラースキーム
    install = {
        colorscheme = { "habamax" },
    },

    -- 自動更新チェック
    checker = {
        enabled = true,
    },
})
