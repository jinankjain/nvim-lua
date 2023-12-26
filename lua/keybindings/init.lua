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

-- Toggle Nvim Tree
m.noremap('<leader>e', ':NvimTreeToggle<cr>')

-- Whichkey help
m.noremap('<leader>w', ':WhichKey<cr>')

m.noremap("<leader>ff", "<cmd>Telescope find_files<cr>")
m.noremap("<leader>fr", "<cmd>Telescope oldfiles<cr>")
m.noremap("<leader>fs", "<cmd>Telescope live_grep<cr>")
m.noremap("<leader>fc", "<cmd>Telescope grep_string<cr>")
