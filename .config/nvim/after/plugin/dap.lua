local dap_servers = {
    "python", -- debugpy
    "codelldb", -- rust
    "delve", -- golang
}

require'mason-nvim-dap'.setup {
    ensure_installed = dap_servers,
    automatic_setup = true,
}
require'mason-nvim-dap'.setup_handlers()
require'dapui'.setup()
require('dap-go').setup()
