return {
    'SCJangra/table-nvim',
    ft = 'markdown',
    config = function(_, opts)
        require('table-nvim').setup(opts)

        -- which-key labels (no mappings created here)
        local wk = require('which-key')
        wk.add({
            { '<leader><leader>t', group = 'Table' },
            { '<leader><leader>tcm', group = 'Table - Move Column' },

            { '<Tab>', desc = 'Next cell', mode = { 'i', 'n' } },
            { '<S-Tab>', desc = 'Previous cell', mode = { 'i', 'n' } },

            { '<leader><leader>tru', desc = 'Insert row above', mode = 'n' },
            { '<leader><leader>trd', desc = 'Insert row below', mode = 'n' },
            { '<leader><leader>tch', desc = 'Insert column left', mode = 'n' },
            { '<leader><leader>tcl', desc = 'Insert column right', mode = 'n' },
            { '<leader><leader>tcmh', desc = 'Move column left', mode = 'n' },
            { '<leader><leader>tcml', desc = 'Move column right', mode = 'n' },
            { '<leader><leader>tt', desc = 'Insert table (pipes)', mode = 'n' },
            { '<leader><leader>tcd', desc = 'Delete column', mode = 'n' },
        })
    end,
    opts = {
        mappings = {
            next = '<TAB>', -- Go to next cell.
            prev = '<S-TAB>', -- Go to previous cell.
            insert_row_up = '<leader>tru', -- Insert a row above the current row.
            insert_row_down = '<leader>trd', -- Insert a row below the current row.
            insert_column_left = '<leader>tch', -- Insert a column to the left of current column.
            insert_column_right = '<leader>tcl', -- Insert a column to the right of current column.
            move_column_left = '<leader>tcmh', -- Move the current column to the left.
            move_column_right = '<leader>tcml', -- Move the current column to the right.
            insert_table = '<leader>tt', -- Insert a new table.
            delete_column = '<leader>tcd', -- Delete the column under cursor.
        },
    },
}
