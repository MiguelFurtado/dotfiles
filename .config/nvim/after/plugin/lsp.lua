local lsp_servers = {
    'rust_analyzer',
    'pyright',
    'tsserver',
    'dockerls',
    'html',
    'cssls',
    'jsonls'
}

require('mason-lspconfig').setup {
    ensure_installed = lsp_servers,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local keybinds = require('fmiguel.keybinds')
for _, lsp in ipairs(lsp_servers) do
    require('lspconfig')[lsp].setup {
        on_attach = function()
            keybinds.set_lsp_keybinds()
        end,
        capabilities = capabilities,
    }
end

