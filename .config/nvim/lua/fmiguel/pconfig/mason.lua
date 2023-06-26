local lsp_servers = {
  "rust_analyzer",
  "gopls",
  "pyright",
  "tsserver",
  "dockerls",
  "html",
  "cssls",
  "jsonls"
}

local dap_servers = {
  "python", -- debugpy
  "codelldb", -- rust
  "delve", -- golang
}

local ft = {
  "rust",
  "go",
  "python",
  "dockerfile",
  "html",
  "css",
  "javascript",
  "typescript",
  "json",
}

function setup()
  require"mason".setup {
      PATH = "prepend",
  }
  require("mason-lspconfig").setup {
    ensure_installed = lsp_servers,
  }
  setup_lspconfig(lsp_servers)
  setup_dap(dap_servers)
end

function setup_lspconfig(servers)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local keybinds = require("fmiguel.keybinds")
  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup {
      on_attach = function()
        keybinds.set_lsp_keybinds()
      end,
      capabilities = capabilities,
    }
  end
end

function setup_dap(servers)
  local dap = require"mason-nvim-dap"
  dap.setup {
    ensure_installed = servers,
    automatic_setup = true,
  }
end

return {ft = ft, setup = setup}

