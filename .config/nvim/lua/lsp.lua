local keybinds = require("keybinds")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["rust_analyzer"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

require("lspconfig")["pyright"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

require("lspconfig")["dockerls"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

require("lspconfig")["tsserver"].setup {
    capabilities=capabilities,
    on_attach = function()
        keybinds.set_lsp_keybinds()
    end
}

