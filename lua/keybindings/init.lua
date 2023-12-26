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

m.nnoremap('<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
m.nnoremap('<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
m.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
m.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
m.nnoremap('gc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
m.nnoremap('gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
m.nnoremap('gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
m.nnoremap('gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
m.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
m.nnoremap('gd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
m.nnoremap('ga', '<cmd>CodeActionMenu<CR>')

m.nnoremap('[x', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
m.nnoremap(']x', '<cmd>lua vim.diagnostic.goto_next()<CR>')
m.nnoremap(']s', '<cmd>lua vim.diagnostic.show()<CR>')

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

m.noremap("<leader>ff", "<cmd>Telescope find_files<cr>")
m.noremap("<leader>fr", "<cmd>Telescope oldfiles<cr>")
m.noremap("<leader>fs", "<cmd>Telescope live_grep<cr>")
m.noremap("<leader>fc", "<cmd>Telescope grep_string<cr>")
