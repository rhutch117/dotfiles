return {
    {
        'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    },
    {                       -- Autoformat
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format({ async = true, lsp_format = 'fallback' })
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = 'fallback',
                    }
                end
            end,
            formatters_by_ft = {
                -- Conform can also run multiple formatters sequentially
                go = { 'gofmt', 'goimports' },
                lua = { 'stylua' },
                python = {
                    'ruff_organize_imports',
                    'ruff_fix',
                    'ruff_format',
                },
                cpp = { 'clang_format' },
                hpp = { 'clang_format' },
                yaml = { 'actionlint' },
                sql = { 'sqlfluff', '--tab-width', '4' },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                javascript = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
                json = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
                html = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
                css = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true },
            },
            formatters = {
                stylua = {
                    prepend_args = {
                        '--indent-type',
                        'Spaces',
                        '--indent-width',
                        '4',
                        '--quote-style',
                        'AutoPreferSingle',
                    },
                },
            },
        },
    },
}
