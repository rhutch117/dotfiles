return {
    {
        'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        -- optional for floating window border decoration
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            -- open lazygit in a new tmux window. It gets slow when opening and closing many times. Maybe a memory leak?
            { '<leader>gg', function() vim.cmd("!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit") end, desc = 'Open LazyGit in tmux window', silent = true },
            { '<leader>gb', '<cmd>Git blame<cr>',                                                               desc = 'Git blame' },
        },
    },
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
}
