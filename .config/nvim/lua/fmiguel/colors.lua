local dark_theme = "carbonfox"
local light_theme = "dawnfox"

-- get the color-scheme from xdg-desktop-portal
local portalOut = vim.fn.system("gdbus call --session " ..
  "--dest=org.freedesktop.portal.Desktop " ..
  "--object-path=/org/freedesktop/portal/desktop " ..
  "--method=org.freedesktop.portal.Settings.Read " ..
  "org.freedesktop.appearance color-scheme"
  ):gsub("^%s*(.-)%s*$", "%1"):gsub("[\n\t]", "")

if portalOut == "(<<uint32 0>>,)" or portalOut == "(<<uint32 2>>,)" then
  vim.o.background = "light"
elseif portalOut == "(<<uint32 1>>,)" then
  vim.o.background = "dark"
end

function choose_theme()
  if vim.o.background == "dark" then
    vim.cmd(string.format("color %s", dark_theme))
    return
  end
  vim.cmd(string.format("color %s", light_theme))
end

choose_theme()

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = {"background"},
  callback = choose_theme,
})


