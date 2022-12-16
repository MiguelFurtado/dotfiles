local dap_servers = {
    "python", -- debugpy
    "codelldb", -- rust
}

require'mason-nvim-dap'.setup {
    ensure_installed = dap_servers,
    automatic_setup = true,
}
require'mason-nvim-dap'.setup_handlers()
require'dapui'.setup()

