  -- Required plugins
  vim.pack.add({
    'https://github.com/yetone/avante.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim'
})

-- Optional dependencies
vim.pack.add({
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/HakonHarnes/img-clip.nvim',
    'https://github.com/zbirenbaum/copilot.lua',
    'https://github.com/stevearc/dressing.nvim',
    'https://github.com/folke/snacks.nvim'
})

-- Avante.nvim with build process

require("avante").setup({
    provider = "azure",
      providers = {
        azure = {
            endpoint = 'https://azure-openai.drwcloud.com',
            deployment = 'gpt-4.1', -- your desired model (or use gpt-4o, etc.)
            timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
            extra_request_body = {
                  temperature = 0,
                  max_completion_tokens = 4096
            }
        }
    }
})
