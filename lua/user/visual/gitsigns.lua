local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

-- several defaults deleted, see <https://github.com/lewis6991/gitsigns.nvim>w
gitsigns.setup {
  signs = {
      add = {
          hl = "GitSignsAdd",
          text = "+",
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn"
      },
      change = {
          hl = "GitSignsChange",
          text = "~",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn"
      },
      delete = {
          hl = "GitSignsDelete",
          text = "_",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn"
      },
      topdelete = {
          hl = "GitSignsDelete",
          text = "‾",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn"
      },
      changedelete = {
          hl = "GitSignsChange",
          text = "~",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn"
      },
  }
}
