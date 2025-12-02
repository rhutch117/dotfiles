return {
    'lervag/wiki.vim',
    config = function()
        -- set keymaps
        local keymap = vim.keymap
        keymap.set('n', '<leader>wj', ':WikiJournal<cr>', { desc = 'Create daily journal entry' }) -- toggle file explorer
        vim.g.wiki_root = '~/wiki'
    end,
}
