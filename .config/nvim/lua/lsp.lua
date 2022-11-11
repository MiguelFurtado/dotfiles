local keybinds = require("keybinds")
local capabilities = require('cmp_nvim_lsp')
    .default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

lspconfig["rust_analyzer"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

lspconfig["pyright"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

lspconfig["dockerls"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

lspconfig["tsserver"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

lspconfig["html"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

lspconfig["cssls"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

lspconfig["jsonls"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

-- Setup auto-complete
-- ===================================================================
vim.opt.completeopt = {"menu","menuone","noselect"}
local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<c-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'path' },
    { name = 'buffer' },
  }),
  experimental = {
    ghost_text = true,
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})
-- ===================================================================
-- Done setting up lsp auto-complete

