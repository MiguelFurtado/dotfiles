local M = {}

function M.setup()
    require"noice".setup {
    cmdline = {
      view = "cmdline", -- classic command line at bottom
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = true, -- enables the Noice messages UI
      view = "mini", -- default view for messages
      view_error = "mini", -- view for errors
      view_warn = "mini", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "mini", -- view for search count messages. Set to `false` to disable
    },
    notify = {
      view = "mini",
    },
    lsp = {
      progress = {
        -- keeping fidget because its more discret
        enabled = false,
      },

      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        -- Messages shown by lsp servers
        enabled = false,
      },
    },
  }
end

return M
