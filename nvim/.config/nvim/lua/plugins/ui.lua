return {
    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            local tn = require('tokyonight')

            tn.setup({
                style = 'night',
                transparent = true, -- Crucial: let tmux colors show through
                styles = { comments = { italic = false } },
            })

            vim.cmd.colorscheme('tokyonight-night')

            -- Create an autocommand group for tmux focus
            local tmux_focus_group = vim.api.nvim_create_augroup('TmuxFocus', { clear = true })

            -- When you ENTER the tmux pane: make it your preferred dark color
            vim.api.nvim_create_autocmd('FocusGained', {
                group = tmux_focus_group,
                callback = function()
                    vim.cmd('highlight Normal guibg=#0f0f14')
                end,
            })

            -- When you LEAVE the tmux pane: make it "none" (transparent)
            -- This allows the DARKER tmux inactive-style to show through
            vim.api.nvim_create_autocmd('FocusLost', {
                group = tmux_focus_group,
                callback = function()
                    vim.cmd('highlight Normal guibg=none')
                end,
            })
        end,
    },
    {
        -- quality of life improvements
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
    },

    {
        -- HELP PAGES RENDERING
        'OXY2DEV/helpview.nvim',
        lazy = false,
    },
}
