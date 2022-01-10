vim.g.nvim_tree_width = 25
vim.g.nvim_tree_indent_markers = 1

local nvim_tree = require('nvim-tree')

nvim_tree.setup {
    auto_open = 1,
    auto_close = 1,
    gitignore = 1
}
