local keybinds = require("keybinds")
local capabilities = require('cmp_nvim_lsp')
    .update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
