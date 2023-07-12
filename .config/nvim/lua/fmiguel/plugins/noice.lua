config = {
  presets = {
    bottom_search = true,
    long_message_to_split = true,
  },

  cmdline = {
    -- view = "cmdline", -- classic command line at bottom
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

  routes = {
    -- show code actions in normal messasge view
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "Code actions",
      },
      view = "messages",
    },
    -- show macro @recording messages
    {
      filter = { event = "msg_showmode" },
      view = "mini",
    },
  },


  lsp = {
    progress = {
      -- keeping fidget because its more discret
      enabled = true,
      view = "mini",
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

  views = {
    mini = {
      size = {
        height = "auto",
        max_height = 1,
        width = "auto",
      }
    }
  },
}

return {
  {
    "folke/noice.nvim",
    version = "^1",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      {
        "MunifTanjim/nui.nvim",
        version = "0.x.x"
      },
    },
    config = config,
  },
}

