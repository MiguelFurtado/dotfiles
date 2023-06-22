local M = {}

function M.setup()
  local dap_servers = {
    "python", -- debugpy
    "codelldb", -- rust
    "delve", -- golang
  }

  local dap = require"mason-nvim-dap"
  dap.setup {
    ensure_installed = dap_servers,
    automatic_setup = true,
  }
end

return M
