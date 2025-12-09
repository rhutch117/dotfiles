return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'whoissethdaniel/mason-tool-installer.nvim',
            'saghen/blink.cmp',
            'j-hui/fidget.nvim',
        },
        config = function()
            -- mason setup
            require('mason').setup()
            local mason_lsp = require('mason-lspconfig')
            local servers = { 'clangd', 'gopls', 'pyright', 'pylsp', 'ts_ls', 'lua_ls' }

            mason_lsp.setup({
                ensure_installed = servers,
                automatic_installation = true,
            })

            -- diagnostics
            vim.diagnostic.config({
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                virtual_text = { spacing = 2, source = 'if_many' },
            })

            -- capabilities
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- keymaps
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local bufnr = event.buf

                    local function map(mode, keys, fn, desc)
                        vim.keymap.set(mode, keys, fn, {
                            buffer = bufnr,
                            desc = 'lsp: ' .. desc,
                        })
                    end

                    map('n', 'K', function()
                        vim.lsp.buf.hover({ border = 'single', max_width = 100 })
                    end, 'hover')

                    map('n', 'grn', vim.lsp.buf.rename, '[r]e[n]ame')
                    map({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, '[g]oto code [a]ction')
                    map('n', 'grr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
                    map('n', 'gri', require('telescope.builtin').lsp_implementations, '[g]oto [i]mplementation')
                    map('n', 'grd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
                    map('n', 'gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
                    map('n', 'go', require('telescope.builtin').lsp_document_symbols, 'document symbols')
                    map('n', 'gw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')
                    map('n', 'grt', require('telescope.builtin').lsp_type_definitions, 'type definition')

                    if client.supports_method('textDocument/inlayHint') then
                        map('n', '<leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
                        end, 'toggle inlay hints')
                    end
                end,
            })

            -- LSP servers
            local lsp_servers = {
                clangd = {
                    cmd = { 'clangd', '--fallback-style={BasedOnStyle: Google, IndentWidth: 2}' },
                },
                gopls = {
                    settings = {
                        gopls = {
                            analyses = { unusedparams = true, shadow = true },
                            staticcheck = true,
                        },
                    },
                },
                pylsp = {
                    on_attach = function(client)
                        -- prevent pylsp from providing "go to definition" (pyright handles this instead)
                        client.server_capabilities.definitionProvider = false
                    end,
                    settings = {
                        pylsp = {
                            plugins = {
                                pyflakes = { enabled = false },
                            },
                        },
                    },
                },
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = 'basic',
                            },
                        },
                    },
                },
                ts_ls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = 'Replace',
                            },
                            diagnostics = {
                                globals = { 'vim' },
                            },
                        },
                    },
                },
            }

            -- Register/extend configs and enable them
            local to_enable = {}
            for name, opts in pairs(lsp_servers) do
                opts.capabilities = capabilities
                -- This merges with defaults from nvim-lspconfig (via its lsp/*.lua files)
                vim.lsp.config(name, opts)
                table.insert(to_enable, name)
            end

            -- Autostart all configured servers
            vim.lsp.enable(to_enable)
        end,
    },
}
