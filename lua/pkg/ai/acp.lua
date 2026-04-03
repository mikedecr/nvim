vim.pack.add({
    "https://github.com/carlos-algms/agentic.nvim"
})

local agentic = require("agentic")
agentic.setup({
    provider = "opencode-acp"
})

local commands = {
    {
        command_name = "AgenticToggleChat",
        command_fn = agentic.toggle,
        description = "Toggle the Agentic chat sidebar open or closed",
    },
    {
        command_name = "AgenticOpenChat",
        command_fn = agentic.open,
        description = "Open the Agentic chat sidebar",
    },
    {
        command_name = "AgenticCloseChat",
        command_fn = agentic.close,
        description = "Close the Agentic chat sidebar",
    },
    {
        command_name = "AgenticStartSession",
        command_fn = agentic.new_session,
        description = "Start a new Agentic session, destroying the current one",
    },
    {
        command_name = "AgenticStopGeneration",
        command_fn = agentic.stop_generation,
        description = "Stop the current agent generation (session stays active)",
    },
    {
        command_name = "AgenticRestoreSession",
        command_fn = agentic.restore_session,
        description = "Restore a previous session from the provider",
    },
    {
        command_name = "AgenticSwitchProvider",
        command_fn = agentic.switch_provider,
        description = "Switch to a different ACP provider",
    },
    {
        command_name = "AgenticRotateLayout",
        command_fn = agentic.rotate_layout,
        description = "Rotate the chat window layout (right -> bottom -> left)",
    },
    {
        command_name = "AgenticAddSelection",
        command_fn = agentic.add_selection,
        description = "Add the current visual selection to the chat context",
    },
    {
        command_name = "AgenticAddFile",
        command_fn = agentic.add_file,
        description = "Add the current file to the chat context",
    },
    {
        command_name = "AgenticAddSelectionOrFile",
        command_fn = agentic.add_selection_or_file_to_context,
        description = "Add the current selection (if any) or file to the chat context",
    },
    {
        command_name = "AgenticAddLineDiagnostics",
        command_fn = agentic.add_current_line_diagnostics,
        description = "Add diagnostics at the current line to the chat context",
    },
    {
        command_name = "AgenticAddBufferDiagnostics",
        command_fn = agentic.add_buffer_diagnostics,
        description = "Add all buffer diagnostics to the chat context",
    },
}

for _, cmd in ipairs(commands) do
    vim.api.nvim_create_user_command(cmd.command_name, cmd.command_fn, { desc = cmd.description })
end

vim.api.nvim_create_user_command("AgenticAddFiles", function(opts)
    agentic.add_files_to_context({ files = opts.fargs })
end, {
    desc = "Add specific files to Agentic context",
    nargs = "+",
    complete = "file",
})
