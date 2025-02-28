[[ -d /opt/homebrew/share/zsh/site-functions ]] && fpath+=(/opt/homebrew/share/zsh/site-functions)

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


# autoswitch_virtualenv: `git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"`
# zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
plugins=(git gh kubectl kube-ps1 zsh-autosuggestions autoswitch_virtualenv)

source $(brew --prefix)/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

# Aliases
alias c="clear"
alias cd="z"
alias ll="eza --icons=auto --git --long --octal-permissions --time=modified --sort=modified"
alias la="eza --icons=auto --git --long --octal-permissions --time=modified --sort=modified --all"
alias cat="bat --theme=ansi"
alias kctx="kubectx"
alias kns="kubens"
alias vi='nvim'
alias vim='nvim'
alias python='python3'
alias zellij='zellij --layout ~/.config/zellij/layouts/custom.kdl'

# K9s config
K9S_CONFIG_DIR="~/.config/k9s"

# Krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Oh-my-posh
OMP_THEME="catppuccin_macchiato"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/${OMP_THEME}.omp.json)"

# Load FZF shell integration
source <(fzf --zsh)

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"