local M = {}

function M.get_sys_theme_pref()
  local handle = io.popen('gdbus call --session'
  .. ' --dest=org.freedesktop.portal.Desktop'
  .. ' --object-path=/org/freedesktop/portal/desktop'
  .. ' --method=org.freedesktop.portal.Settings.Read'
  .. ' org.freedesktop.appearance color-scheme')
  out = string.match(handle:read('*a'), ' %d')

  if out == ' 1' then
    return 'dark'
  else
    return 'light'
  end
end


return M
