return {
    {
        -- Neovim plugin to autmatically highlight other uses of the
        -- word under the cursor
        -- https://github.com/RRethy/vim-illuminate
        'RRethy/vim-illuminate',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            delay = 120,
            providers = { 'lsp', 'treesitter', 'regex' },
            modes_denylist = { 'i' }, -- no highlights while typing
            filetypes_denylist = { 'TelescopePrompt', 'lazy', 'NvimTree', 'Trouble' },
        },
        config = function(_, opts)
            require('illuminate').configure(opts)
        end,
    },
}
