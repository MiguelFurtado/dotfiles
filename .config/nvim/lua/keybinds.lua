local keybinds = {}

local function map(m, k ,v)
    vim.keymap.set(m, k, v, {silent=true})
end


function keybinds.set_general_keybinds()
    map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>")
    map('n', '<leader>dg', "<cmd>:Telescope diagnostics<CR>")
    map('n', '<leader>fg', "<cmd>:Telescope live_grep<CR>")
    map('n', '<leader>E', ":Ex<CR>")
    map('n', '<leader>fe', ":Telescope file_browser<CR>")
    map('n', '<leader>w', "<cmd>lua vim.cmd('w')<CR>")
    map('n', '<leader>e', "<cmd>lua vim.diagnostic.open_float()<CR>")
end

function keybinds.set_dap_keybinds()
    map('n', '<F5>', ":lua require('dap').continue()<CR>")
    map('n', '<F2>', ":lua require('dap').step_over()<CR>")
    map('n', '<F3>', ":lua require('dap').step_into()<CR>")
    map('n', '<F4>', ":lua require('dap').step_out()<CR>")
    map('n', '<leader><F5>', ":lua require('dap').close()<CR>")
    map('n', '<leader>b', ":lua require('dap').toggle_breakpoint()<CR>")
    -- conditional breakpoint
    map('n', '<leader>B', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
    map('n', '<leader>dui', ":lua require('dapui').toggle()<CR>")
end

function keybinds.set_lsp_keybinds()
    -- passing functions references instead of string with command
    -- `buffer 0` means whatever the current buffer is so the shortcuts only
    -- work on files that trigger the lsp
    map("n", "K", vim.lsp.buf.hover, {buffer = 0})
    map("n", "<leader>D", vim.lsp.buf.definition, {buffer = 0})
    map("n", "<leader>t", vim.lsp.buf.type_definition, {buffer = 0})
    map("n", "<leader>i", vim.lsp.buf.implementation, {buffer = 0})
    map("n", "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
    map("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
    map("n", "<leader>R", vim.lsp.buf.rename, {buffer = 0})
    map("n", "<leader>r", "<cmd>:Telescope lsp_references<CR>", {buffer = 0})
    map("n", "<leader>a", vim.lsp.buf.code_action, {buffer = 0})
end

return keybinds

