# My Neovim config

## Installation

Backup current nvim config file

```bash
cp -r .config/nvim .config/nvim-backup
mv .local/share/nvim/ .local/share/nvim.bak
```

Clone repo into `.config/nvim` folder

```bash
git clone https://github.com/tuandzung/vim-config.git ~/.config/nvim
```

Clone packer.nvim

```bash
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install packages

```bash
nvim +"lua require'plugins-list'; require'packer'.sync()"
```

## Screenshots
