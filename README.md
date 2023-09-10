# Migration to Lazy:

[Packer is unmaintained](https://github.com/wbthomason/packer.nvim).
This configuration has migrated to Lazy.nvim for package management.

- If proceeding with lazy, you should clean out your local packer install directory.
  Failure to do so may cause conflicts (esp. with Treesitter, see [here](https://www.reddit.com/r/neovim/comments/128exsu/treesitter_always_compiling_parsers_on_startup/))
- Alternatively: checkout a [legacy Packer branch](https://github.com/mikedecr/nvim/tree/legacy-packer) (unmaintained).


# Neovim Configs

![splash-page](https://pbs.twimg.com/media/FmuQu9PWIAEi4Iz?format=png&name=4096x4096)

## Fresh install

1. Lazy (package manager) will try to bootstrap itself. Be warned.
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

