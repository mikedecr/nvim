return {
    'chomosuke/term-edit.nvim',
    lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
    version = '1.*',
    config = function()
        require('term-edit').setup {
            -- Mandatory: Set this to a lua pattern*, or a table of possible patterns,
            -- that matches the end of your prompt.
            -- Typical bash/zsh: '%$ '.
            -- Typical powershell / fish: '> '.
            -- Typical windows cmd: '>'.
            -- * How to write lua patterns: https://www.lua.org/pil/20.2.html)
            prompt_end = '%$ ',
        }
    end
}
