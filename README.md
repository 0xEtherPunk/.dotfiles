# 🎨 Catppuccin Dotfiles

> A modern terminal environment powered by the Catppuccin color palette

[![Catppuccin](https://img.shields.io/badge/Catppuccin-Themed-pink?style=flat-square)](https://github.com/catppuccin)
[![Zsh](https://img.shields.io/badge/Shell-Zsh-green?style=flat-square)](https://www.zsh.org/)

## 📦 Components

| App | Purpose | Status |
|-----|---------|--------|
| **[Lazygit](https://github.com/jesseduffield/lazygit)** | Git TUI | ✅ |
| **[Neofetch](https://github.com/dylanaraps/neofetch)** | System Info | ✅ |
| **[Neovim](https://neovim.io/)** | Text Editor | ✅ |
| **[Starship](https://starship.rs/)** | Shell Prompt | ✅ |
| **[WezTerm](https://wezfurlong.org/wezterm/)** | Terminal | ✅ |
| **[Yazi](https://github.com/sxyazi/yazi)** | File Manager | ✅ |
| **[Zsh](https://www.zsh.org/)** | Shell + Zinit | ✅ |


## 🎨 Theme Flavors

- 🌻 **Latte** - Light & Fresh
- 🪴 **Frappé** - Cool & Balanced
- 🌺 **Macchiato** - Warm & Cozy
- 🌿 **Mocha** - Rich & Dark


## ⚡ Quick Setup

#### Install required packages:
```
sudo apt install git zsh neovim stow
```

#### Clone repository:
```
git clone https://github.com/0xEtherPunk/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

#### Use stow to create symlinks:
```
stow lazygit neofetch nvim starship wezterm yazi zsh
```


