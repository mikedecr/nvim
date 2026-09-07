require "options"
require "maps"
require "pkg"

local locale_module_name = "locale"
local ok, err = pcall(require, locale_module_name)
if not ok then
    local msg = "Config supports %s module for locale-specific configuration, but did not find that module. Stacktrace:\n%s"
    vim.notify(msg:format(locale_module_name, err), vim.log.levels.WARN)
end
