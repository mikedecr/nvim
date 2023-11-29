local ok, carbon = pcall(require, 'carbon-now')
if not ok then
    vim.notify("failed: carbon")
end

carbon.setup({
    open_cmd = "open",
    options = {
        -- bg = "gray",
        bg = "#4C566A",
        -- drop_shadow_blur = "68px",
        drop_shadow = true,
        -- drop_shadow_offset_y = "20px",
        font_family = "Inconsolata",
        -- font_size = "18px",
        -- line_height = "133%",
        -- line_numbers = true,
        theme = "nord",
        titlebar = "(via carbon-now.nvim)",
        watermark = false,
        width = "680",
        window_theme = "round",
  },
})

