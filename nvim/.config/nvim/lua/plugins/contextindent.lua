return {
    -- Manages indenting within code blocks such as markdown
    'wurli/contextindent.nvim',
    opts = { pattern = '*.md' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
}
