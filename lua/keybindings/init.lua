vim.g.mapleader = ' '

local m = require('mapx')

-- Easy movement across split panes
m.nmap('<C-h>', '<C-w>h')
m.nmap('<C-l>', '<C-w>l')
m.nmap('<C-j>', '<C-w>j')
m.nmap('<C-k>', '<C-w>k')

-- Relieve for my fingers
m.nnoremap(';', ':')
m.nnoremap(':', ';')

-- Better indentation
m.vnoremap('<', '<gv')
m.vnoremap('>', '>gv')

-- Move between autocompletion suggestion
m.inoremap("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], "silent", "expr")
m.inoremap("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], "silent", "expr")

-- Toggle Nvim Tree
m.noremap('<leader>e', ':NvimTreeToggle<cr>')

-- Whichkey help
m.noremap('<leader>w', ':WhichKey<cr>')
