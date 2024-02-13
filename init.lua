if vim.g.vscode then
    -- VSCode extension
else
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    -- Example using a list of specs with the default options
    vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")

    require("lazy").setup({
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter").setup({
                    indent = {
                        enable = true
                    },
                    ensure_installed = { "help", "javascript", "typescript", "c", "lua", "python" },

                    -- Install parsers synchronously (only applied to `ensure_installed`)
                    sync_install = false,

                    -- Automatically install missing parsers when entering buffer
                    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                    auto_install = true,

                    highlight = {
                        -- `false` will disable the whole extension
                        enable = true,

                        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                        -- Using this option may slow down your editor, and you may see some duplicate highlights.
                        -- Instead of true it can also be a list of languages
                        additional_vim_regex_highlighting = false
                    }
                })
            end
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.2',
            -- or                              , branch = '1.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            'rose-pine/neovim',
            name = 'rose-pine',
            config = function()
                require('rose-pine').setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = 'dawn',
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = 'dawn',
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = false,

                --- @usage string hex value or named color from rosepinetheme.com/palette
                groups = {
                    background = 'base',
                    background_nc = '_experimental_nc',
                    panel = 'surface',
                    panel_nc = 'base',
                    border = 'highlight_med',
                    comment = 'muted',
                    link = 'iris',
                    punctuation = 'subtle',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    warn = 'gold',

                    headings = {
                        h1 = 'iris',
                        h2 = 'foam',
                        h3 = 'rose',
                        h4 = 'gold',
                        h5 = 'pine',
                        h6 = 'foam',
                    }
                    -- or set all headings at once
                    -- headings = 'subtle'
                },

                -- Change specific vim highlight groups
                -- https://github.com/rose-pine/neovim/wiki/Recipes
                highlight_groups = {
                    ColorColumn = { bg = 'rose' },

                    -- Blend colours against the "base" background
                    CursorLine = { bg = 'foam', blend = 10 },
                    StatusLine = { fg = 'love', bg = 'love', blend = 10 },

                    -- By default each group adds to the existing config.
                    -- If you only want to set what is written in this config exactly,
                    -- you can set the inherit option:
                    Search = { bg = 'gold', inherit = false },
                }
            })
                -- Set colorscheme after options
                vim.cmd('colorscheme rose-pine')
            end
        },
        {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v3.x',
          lazy = true,
          config = false,
          init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
          end,
        },
        {
          'williamboman/mason.nvim',
          lazy = false,
          config = true,
        },

        -- Autocompletion
        {
          'hrsh7th/nvim-cmp',
          event = 'InsertEnter',
          dependencies = {
            {'L3MON4D3/LuaSnip'},
          },
          config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
              formatting = lsp_zero.cmp_format(),
              mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
              })
            })
          end
        },

        -- LSP
        {
          'neovim/nvim-lspconfig',
          cmd = {'LspInfo', 'LspInstall', 'LspStart'},
          event = {'BufReadPre', 'BufNewFile'},
          dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
          },
          config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
              -- see :help lsp-zero-keybindings
              -- to learn the available actions
              -- lsp_zero.default_keymaps({buffer = bufnr})
              local opts = {buffer = bufnr, remap = false}

              vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
              vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
              vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
              vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
              vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
              vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
              vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
              vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
              vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
              vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)

            require('mason-lspconfig').setup({
              ensure_installed = {'tsserver', 'pyright'},
              handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                  -- (Optional) Configure lua language server for neovim
                  local lua_opts = lsp_zero.nvim_lua_ls()
                  require('lspconfig').lua_ls.setup(lua_opts)
                end,
              }
            })
          end
        },
        {
            'zbirenbaum/copilot.lua',
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
              require("copilot").setup({
                panel = {
                  enabled = true,
                  auto_refresh = false,
                  keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>"
                  },
                  layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4
                  },
                },
                suggestion = {
                  enabled = true,
                  auto_trigger = false,
                  debounce = 75,
                  keymap = {
                    accept = "<C-l>",
                    accept_word = false,
                    accept_line = false,
                    next = "<C-]>",
                    prev = "<C-[>",
                    dismiss = "<C-c>",
                  },
                },
                filetypes = {
                  yaml = false,
                  markdown = false,
                  help = false,
                  gitcommit = false,
                  gitrebase = false,
                  hgcommit = false,
                  svn = false,
                  cvs = false,
                  ["."] = false,
                },
                copilot_node_command = "/Users/lishihong/.nvm/versions/node/v18.14.2/bin/node", -- Node.js version must be > 18.x
                server_opts_overrides = {},
                        })
            end,
        },
        { 'mg979/vim-visual-multi',                 branch = 'master' },
        { 'tpope/vim-fugitive' },
        { 'f-person/git-blame.nvim'},
        { 'nvim-treesitter/nvim-treesitter-context' },
        -- { 'HiPhish/rainbow-delimiters.nvim'},
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        {
          "folke/zen-mode.nvim",
          opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        },
        {
          "mbbill/undotree"
        }
        -- {
        --     "aserowy/tmux.nvim",
        --     config = function() return require("tmux").setup() end
        -- }
    })

    vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


    require('mason').setup({})

    require("treesitter-context").setup({
        enable = true,          -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,          -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',   -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',        -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,   -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })

    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup { scope = { highlight = highlight } }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- vim.o.background = "light"
    vim.opt.termguicolors = true
    vim.opt.guicursor = ""
    vim.opt.nu = true
    vim.opt.cursorline = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.smartindent = true
    vim.opt.swapfile = false
    vim.opt.colorcolumn = "80"
    vim.opt.signcolumn = "yes"
    vim.opt.hlsearch = true
    vim.opt.incsearch = true

    vim.opt.updatetime = 50
    vim.opt.colorcolumn = "80"

    vim.opt.scrolloff = 8
    vim.opt.signcolumn = "yes"
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
    vim.opt.isfname:append("@-@")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )

    -- greatest remap ever
    vim.keymap.set("x", "<leader>p", [["_dP]])

    -- search by visual select
    vim.keymap.set("v",  "//" , [[y/<C-R>"<CR>]])
end

