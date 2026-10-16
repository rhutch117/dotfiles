return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        gui_style = {
            fg = 'BOLD',
            bg = 'NONE',
        },
        keywords = {
            -- 'error' is the theme's red (DiagnosticError)
            TODO = { color = 'error' },
        },
        highlight = {
            -- Only the keyword itself is colored and bold. The text after it
            -- keeps the normal comment color
            keyword = 'fg',
            after = '',
        },
    },
}
