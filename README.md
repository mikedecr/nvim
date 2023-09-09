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

Consider eliminating / better documenting packages:

- [ ] harpoon
- [ ] project
- [ ] lzp_zero -> separate
- [ ] headlines / pandoc
- [ ] yati
- [ ] neoclip
- [ ] autopairs vs surround
- [ ] winsep alternative
- [ ] zen


Learn about...

- after/
- ftplugin/
- filetype-specific maps
- language agnostic comment string
    - how to handle "polymode" comments
- System clipboard / yank over ssh:
    - yanking to system clipboard doesn't work over ssh
    - <https://github.com/fcpg/vim-osc52>
    - <https://www.reddit.com/r/vim/comments/ac9eyh/talk_i_gave_on_going_mouseless_with_vim_tmux/>
    - set up some kind of autocmd to source the osc fwd if ssh'd?

