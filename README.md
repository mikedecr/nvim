# Neovim Configs

![splash-page](https://pbs.twimg.com/media/FmuQu9PWIAEi4Iz?format=png&name=4096x4096)

## Fresh install

1. Ensure Packer is installed:

    ```
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

    Once installed, you must run `:PackerSync` to install plugins.

2. Telescope will want to use [ripgrep](https://github.com/BurntSushi/ripgrep#installation) and [fd](https://github.com/sharkdp/fd)

3. Some language servers want Node.js: `brew install node`



## other todos:
- just a general audit of wth is going on:
    - snippets
    - cmp
    - lsp-zero keymaps

- System clipboards:
    - yanking to system clipboard doesn't work over ssh
    - <https://github.com/fcpg/vim-osc52>
    - <https://www.reddit.com/r/vim/comments/ac9eyh/talk_i_gave_on_going_mouseless_with_vim_tmux/>
    - set up some kind of autocmd to source the osc fwd if ssh'd?

- ftplugin organization

- filetype maps and snips
    - R
    - python
    - markdown

- language-agnostic big-comment snippet
    - there should be a variable storing the comment string for a filetype
    - how to handle "polymode" comments

- remove unnecessary / tangled bits
    - git signs ... ?
    - other icons

- better documentation:
    - lsp
    - cmp
    - treesitter
    - ...

