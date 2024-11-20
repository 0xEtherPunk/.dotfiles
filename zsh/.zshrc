# Настройка PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# golang
export PATH=$PATH:$(go env GOPATH)/bin

export TERM=xterm-256color

# npm
export PATH="/home/cypherjunkie/.npm-global/bin:$PATH"

# Используем bat для подсветки синтаксиса в lazygit
export LAZYGIT_NEW_CMD_TEMPLATE="batcat --theme=Catppuccin-mocha {}"

# Настройка для lazygit
export VISUAL="batcat --theme=Catppuccin-mocha --paging=never"
export EDITOR="batcat --theme=Catppuccin-mocha --paging=never"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Настройка яркого цветного приглашения
PROMPT='%B%F{#1cdc9a}%n@%f%F{#3dace8}%~%f%b '

# alias
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

echo "Initial SHELL: $SHELL" >> ~/shell_check.log

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Load plugins
zinit light zsh-users/zsh-autosuggestions

# neovim
alias vim=nvim
alias vi=nvim

# Сначала базовый плагин
zinit light zsh-users/zsh-syntax-highlighting

# Затем тема (с правильным названием репозитория)
zinit light catppuccin/zsh-syntax-highlighting
source ~/.local/share/zinit/plugins/catppuccin---zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search

# Load fzf and fzf-tab
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

zinit ice wait'1' lucid
zinit light Aloxaf/fzf-tab

# Настройка fzf
zinit ice as"command" pick"bin/fzf-tmux"
zinit light junegunn/fzf

zinit ice as"completion"
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh

zinit ice as"completion"
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh

# Load z.lua for fast directory navigation
zinit ice lucid wait'0'
zinit light skywind3000/z.lua

# Install zoxide
zinit ice wait lucid from"gh-r" as"program" pick"zoxide" \
atclone"./zoxide init zsh > init.zsh" \
atpull"%atclone" src"init.zsh"
zinit light ajeetdsouza/zoxide

# Install zoxide
zinit ice wait lucid from"gh-r" as"program" pick"zoxide" \
  atclone"./zoxide init zsh > init.zsh" \
  atpull"%atclone" src"init.zsh"
zinit light ajeetdsouza/zoxide

# Install exa
zinit ice from"gh-r" as"program" mv"bin/exa* -> exa"
zinit light ogham/exa

   # ripgrep
   zinit ice as"command" from"gh-r" bpick"*x86_64-unknown-linux-musl*" mv"ripgrep* -> rg" pick"rg"
   zinit light BurntSushi/ripgrep
      export PATH=$PATH:$HOME/.local/share/zinit/plugins/BurntSushi---ripgrep/rg

    # OhMyZsh plugins
       zinit snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh
       zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# аналог find более умный  fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd


# Универсальная настройка предпросмотра для fzf-tab
zstyle ':fzf-tab:complete:*' fzf-preview '
    if [ -d $realpath ]; then
        tree -C $realpath | head -200
    elif [ -f $realpath ]; then
        file -b $realpath
        echo
        bat --style=numbers --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath
    else
        echo "Нет предпросмотра"
    fi
'
zstyle ':fzf-tab:complete:*' fzf-flags --preview-window=right:60%

# Настройка fzf-tab для автоматической вставки выбранного элемента
zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' continuous-trigger 'tab'

# Настройка fzf-tab для totp
zstyle ':fzf-tab:complete:totp:argument-1' fzf-preview 'echo $realpath'
zstyle ':fzf-tab:complete:totp:*' fzf-flags --height=50% --layout=reverse --border
zstyle ':fzf-tab:complete:totp:*' insert-space true


# Настройки истории
setopt HIST_IGNORE_DUPS       # Игнорировать повторяющиеся команды
setopt HIST_FIND_NO_DUPS      # Не показывать дубликаты при поиске
setopt HIST_REDUCE_BLANKS     # Удалять лишние пробелы
setopt HIST_SAVE_NO_DUPS      # Не сохранять дубликаты в файле истории
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Добавляем установку Starship через Zinit
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

eval "$(starship init zsh)"

# yazi
export PATH="$PATH:/home/cypherjunkie/Документы/Apps/yazi/target/release"


export PATH="$HOME/.local/bin:$PATH"


### End of Zinit configuration

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export COLORTERM=truecolor

export BAT_CONFIG_PATH="/path/to/bat.conf"

export EDITOR=nano
