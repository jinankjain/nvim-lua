require('gitsigns').setup({})
vim.cmd "set statusline+=%{get(b:,'gitsigns_status','')}"
