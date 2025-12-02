return {
    {
        -- MARKDOWN VIEWER/RENDERER
        'OXY2DEV/markview.nvim',
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
            'saghen/blink.cmp',
        },
        opts = {
            preview = {
                enable = false,
            },
        },
        keys = {
            {
                '<leader><leader>v',
                '<Cmd>Markview toggle<CR>',
                desc = 'toggle markdown preview',
                mode = 'n',
                noremap = true,
                silent = true,
            },
        },
    },
}
