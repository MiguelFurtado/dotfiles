local M = {}

function M.setup()
  require"mason".setup {
      PATH = "prepend",
  }
  require("mason-lspconfig").setup {
    ensure_installed = require"fmiguel.pconfig.lsp_config".lsp_servers,
  }
end

return M

