vim.cmd('filetype plugin indent on')
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 20
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.opt.colorcolumn = "80"

vim.wo.wrap = false
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

vim.o.tabstop = 8
vim.bo.tabstop = 8
vim.o.softtabstop = 8
vim.bo.softtabstop = 8
vim.o.shiftwidth = 8
vim.bo.shiftwidth = 8
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.cmd('autocmd Filetype javascript setlocal tabstop=4')
vim.cmd('autocmd Filetype javascript setlocal softtabstop=4')
vim.cmd('autocmd Filetype javascript setlocal shiftwidth=4')

vim.cmd('autocmd Filetype circom setlocal tabstop=4')
vim.cmd('autocmd Filetype circom setlocal softtabstop=4')
vim.cmd('autocmd Filetype circom setlocal shiftwidth=4')
