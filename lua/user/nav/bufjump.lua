-- :::::::::::::::::
-- :::: bufjump ::::
-- :::::::::::::::::

-- provides easy keymaps for previous/next buffer

local ok, bufjump = pcall(require, 'bufjump')
if not ok then vim.notify('failed: bufjump'); return; end

bufjump.setup({ forward = "<C-n>",
                backward = "<C-p>",
                on_success = nil })

