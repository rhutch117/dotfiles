local function wiki_root()
    return vim.fn.expand(vim.g.wiki_root or '~/wiki')
end

local function wiki_telescope_picker(method)
    return function(...)
        return require('wiki.telescope')[method](...)
    end
end

local function wiki_live_grep()
    require('telescope.builtin').live_grep({
        cwd = wiki_root(),
        prompt_title = 'Wiki Grep',
    })
end

return {
    'lervag/wiki.vim',
    init = function()
        vim.g.wiki_root = wiki_root()
        vim.g.wiki_select_method = {
            pages = wiki_telescope_picker('pages'),
            tags = wiki_telescope_picker('tags'),
            toc = wiki_telescope_picker('toc'),
            links = wiki_telescope_picker('links'),
        }
    end,
    config = function()
        local keymap = vim.keymap

        vim.api.nvim_create_user_command('WikiGrep', wiki_live_grep, {
            desc = 'Search wiki notes with Telescope live_grep',
        })

        keymap.set('n', '<leader>wj', '<cmd>WikiJournal<cr>', { desc = 'Create daily journal entry' })
        keymap.set('n', '<leader>wP', '<cmd>WikiPages<cr>', { desc = 'Search wiki pages' })
        keymap.set('n', '<leader>wG', '<cmd>WikiGrep<cr>', { desc = 'Search wiki contents' })
    end,
}
