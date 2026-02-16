vim.pack.add({
    "https://github.com/yetone/avante.nvim",
    "http://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
})

local avante = require("avante")
avante.setup({
    provider = "ollama",
    providers = {
      ollama = {
        model = "gpt-oss:latest",
        is_env_set = require("avante.providers.ollama").check_endpoint_alive,
      },
    }
})
