require('nvim-autopairs').setup {
  check_ts = true,
  disable_filetype = { 'TelescopePrompt' },
  -- do not trigger if a close pair is in the same line
  enable_check_bracket_line = false,
}

