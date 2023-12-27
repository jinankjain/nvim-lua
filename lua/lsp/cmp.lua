-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode')

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For vsnip user.
    -- { name = 'luasnip' },
    -- For ultisnips user.
    -- { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path' }
  },
  formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})}
})
