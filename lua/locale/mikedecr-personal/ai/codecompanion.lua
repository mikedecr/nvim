-- CodeCompanion + Amp via the amp-acp ACP wrapper.
--
-- amp-acp (https://github.com/tao12345666333/amp-acp) exposes the Amp CLI
-- as an ACP-compliant agent. CodeCompanion connects to it over stdio and
-- renders Amp's file edits as in-editor diffs you can review/tweak before
-- accepting.
--
-- Requires: `npx` on PATH (Node 18+) and Amp CLI already logged in
-- (`amp login`) so amp-acp can reuse your credentials.

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/olimorris/codecompanion.nvim",
})

require("codecompanion").setup({
    adapters = {
        acp = {
            -- Custom adapter for Amp via amp-acp.
            amp = function()
                local helpers = require("codecompanion.adapters.acp.helpers")
                return {
                    name = "amp",
                    formatted_name = "Amp",
                    type = "acp",
                    roles = { llm = "assistant", user = "user" },
                    commands = {
                        default = { "npx", "-y", "amp-acp" },
                    },
                    defaults = {
                        mcpServers = {},
                        timeout = 30000,
                    },
                    parameters = {
                        protocolVersion = 1,
                        clientCapabilities = {
                            fs = { readTextFile = true, writeTextFile = true },
                        },
                        clientInfo = {
                            name = "CodeCompanion.nvim",
                            version = "1.0.0",
                        },
                    },
                    handlers = {
                        setup = function(_) return true end,
                        auth = function(_) return true end,
                        form_messages = function(self, messages, capabilities)
                            return helpers.form_messages(self, messages, capabilities)
                        end,
                        on_exit = function(_, _) end,
                    },
                }
            end,
        },
    },
    interactions = {
        chat = {
            adapter = "amp",
        },
    },
    opts = {
        log_level = "INFO",
    },
})

-- Keymaps (mirroring your opencode.lua style).
vim.keymap.set({ "n", "v" }, "<leader>aa",
    "<cmd>CodeCompanionChat Toggle<cr>",
    { desc = "Toggle Amp chat (CodeCompanion)" })

vim.keymap.set({ "n", "v" }, "<leader>ac",
    "<cmd>CodeCompanionActions<cr>",
    { desc = "CodeCompanion actions palette" })

vim.keymap.set("v", "<leader>ax",
    "<cmd>CodeCompanionChat Add<cr>",
    { desc = "Add selection to CodeCompanion chat" })
