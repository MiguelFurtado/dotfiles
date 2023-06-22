local keybinds = {}

local function nmap(keys, action)
  vim.keymap.set("n", keys, action, {silent=true})
end


function keybinds.set_general_keybinds()
  nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
  nmap("<leader>sw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
  nmap("<leader>ss", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
  nmap("<leader>dg", "<cmd>lua require('telescope.builtin').diagnostics()<CR>")
  nmap("<leader>gg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
  nmap("<leader>bb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
  nmap("<leader>pp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>")

  nmap("<leader>w", "<cmd>lua vim.cmd('w')<CR>")
  nmap("<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>")

  nmap("<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
  nmap("<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>")
  nmap("<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
  nmap("<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
  nmap("<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
  nmap("<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
end

function keybinds.set_dap_keybinds()
  nmap("<F5>", ":lua require('dap').continue()<CR>")
  nmap("<F2>", ":lua require('dap').step_over()<CR>")
  nmap("<F3>", ":lua require('dap').step_into()<CR>")
  nmap("<F4>", ":lua require('dap').step_out()<CR>")
  nmap("<leader><F5>", ":lua require('dap').close()<CR>")
  nmap("<leader>B", ":lua require('dap').toggle_breakpoint()<CR>")
  -- conditional breakpoint
  nmap("<leader>cB", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
  nmap("<leader>dui", ":lua require('dapui').toggle()<CR>")
end

function keybinds.set_lsp_keybinds()
  -- passing functions references instead of string with command
  -- `buffer 0` means whatever the current buffer is so the shortcuts only
  -- work on files that trigger the lsp
  nmap("K", vim.lsp.buf.hover, {buffer = 0})
  nmap("<leader>gd", vim.lsp.buf.definition, {buffer = 0})
  nmap("<leader>gt", vim.lsp.buf.type_definition, {buffer = 0})
  nmap("<leader>gi", vim.lsp.buf.implementation, {buffer = 0})
  nmap("<leader>gr", "<cmd>:Telescope lsp_references<CR>", {buffer = 0})
  nmap("<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
  nmap("<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
  nmap("<leader>R", vim.lsp.buf.rename, {buffer = 0})
  nmap("<leader>a", vim.lsp.buf.code_action, {buffer = 0})
end

return keybinds

