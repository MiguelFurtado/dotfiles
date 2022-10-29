local mod = {}

function mod.setup()
    require('keybinds').set_dap_keybinds()
    require('dap-python').setup('python3')
    require('dap-python').test_runner = 'pytest'
    require('dapui').setup()
    require('nvim-dap-virtual-text').setup()
end

return mod

