local modules  = {
    "md.options",
    "md.maps",
    "md.colors",
    "md.telescope",
    "md.alpha",
    "md.oil",
    "md.projects",
    "md.lsp",
    "md.git",
    "md.cmp",
    "md.supermaven",
    "md.treesitter",
    "md.pairs",
    "md.slime",
    "md.whichkey"
}

for _, module in ipairs(modules) do
    local ok, data_or_err = pcall(require, module)
    if not ok then
        print("Error loading module: " .. module)
        print(data_or_err)
    end
end
