nt_ok, nt = pcall(require, "neo-tree")
if not nt_ok then
    vim.notify("neo-tree failed")
    return
end

nt.setup({
    default_component_configs = {
        mapping_options = {
          noremap = true,
          nowait = true,
        },
    },
    filesystem = {
      window = {
        width = 30
      },
    }
})




