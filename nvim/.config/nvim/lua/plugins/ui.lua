return {
    {
        'vague-theme/vague.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require('vague').setup({
                -- optional configuration here
            })
            vim.cmd('colorscheme vague')
        end,
    },
    -- { -- You can easily change to a different colorscheme.
    --     -- Change the name of the colorscheme plugin below, and then
    --     -- change the command in the config to whatever the name of that colorscheme is.
    --     --
    --     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    --     'folke/tokyonight.nvim',
    --     priority = 1000, -- Make sure to load this before all the other start plugins.
    --     config = function()
    --         local tn = require('tokyonight')
    --
    --         tn.setup({
    --             style = 'night',
    --             styles = { comments = { italic = false } },
    --             on_highlights = function(highlights, _)
    --                 for _, hl in pairs(highlights) do
    --                     if type(hl) == 'table' then
    --                         hl.bold = false
    --                     end
    --                 end
    --             end,
    --         })
    --
    --         vim.cmd.colorscheme('tokyonight-night')
    --     end,
    -- },
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
