return {
  {
    "windwp/nvim-autopairs", -- auto-close pairs
    config = {
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
      -- do not trigger if a close pair is in the same line
      enable_check_bracket_line = false,
    },
    event = "InsertEnter",
  },
}

