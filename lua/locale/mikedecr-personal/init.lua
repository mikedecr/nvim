local module_path = "locale.mikedecr-personal."
local modules = {
    "ai"
}
for _, module in ipairs(modules) do
    require(module_path .. module)
end
