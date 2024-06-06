
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git gh kubectl kube-ps1 zsh-autosuggestions)

source $HOMEBREW_PREFIX/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

# Aliases
alias c="clear"
alias cd="z"
alias ll="eza --icons=auto --git --long --octal-permissions"
alias cat="bat --theme=ansi"
alias kctx="kubectx"
alias kns="kubens"
alias vi='nvim'
alias vim='nvim'
alias python='python3'
alias zellij='zellij --layout .config/zellij/layouts/custom.kdl'

# K9s config
K9S_CONFIG_DIR="~/.config/k9s"

# Krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Powerlevel10k theme
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh