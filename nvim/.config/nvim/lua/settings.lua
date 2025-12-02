-- OPTIONS
-- To see what an option is set to execute `:lua = vim.o.<name>`
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 999
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true
vim.opt.lazyredraw = true

-- Indentation
vim.opt.expandtab = true -- tab inserts spaces instead of tab char
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.virtualedit = 'block'

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.inccommand = 'split'

-- Files + Undo
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- List Characters
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
}

-- Clipboard
vim.opt.clipboard:append({ 'unnamedplus', 'unnamed' })

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- use Treesitter to determine fold spots
vim.opt.foldlevel = 99

-- Diagnostics (modern)
-- =========================================
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})
