-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true })

-- Sync plugins
vim.keymap.set('', '<leader><leader>ps', '<Cmd>Lazy sync<CR>', { desc = 'update vim plugins' })

-- Diagnostics
vim.keymap.set('n', '<leader><leader>dd', function()
    vim.diagnostic.enable(false)
end, { desc = 'Disable diagnostics' })
vim.keymap.set('n', '<leader><leader>de', function()
    vim.diagnostic.enable()
end, { desc = 'Enable diagnostics' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Surround a word with quotes, backticks, and others
vim.keymap.set('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', { desc = 'Surround with single-quotes' })
vim.keymap.set('n', "<leader>'", "viw<esc>a'<esc>bi'<esc>lel", { desc = 'Surround with double-quotes' })
vim.keymap.set('n', '<leader>`', 'viw<esc>a`<esc>bi`<esc>lel', { desc = 'Surround with backticks' })
vim.keymap.set('n', '<leader>*', 'viw<esc>a*<esc>bi*<esc>lel', { desc = 'Surround with asterisks' })

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Visual --
-- Stay in visual mode while indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent selection left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection right' })
-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', { desc = 'Move text up' })
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', { desc = 'Move text down' })
vim.keymap.set('v', 'p', '"_dP', { desc = '' })

-- Visual Block --
-- Move text up and down
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { desc = 'Move text up' })
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { desc = 'Move text down' })
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv", { desc = '' })
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv", { desc = '' })

-- Escape with jk
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = '[S]earch [N]eovim files' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    })
end, { desc = '[S]earch [/] in Open Files' })
