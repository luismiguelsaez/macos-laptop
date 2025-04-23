export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git gh kubectl kube-ps1 zsh-autosuggestions autoswitch_virtualenv)

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
alias ll="eza --icons=auto --git --long --octal-permissions --time=modified --sort=modified"
alias la="eza --icons=auto --git --long --octal-permissions --time=modified --sort=modified --all"
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

# Dotnet
export PATH="$PATH:/Users/lmsm/.dotnet/tools"

# Oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/cloud-context.omp.json)"

# Load FZF shell integration
source <(fzf --zsh)

export PATH="$HOME/.local/bin:$PATH"

# Autoload virtualenv
# https://github.com/rothgar/mastering-zsh/blob/master/docs/config/hooks.md
activate_venv_on_cd() {
    local venv_dir=".venv"
    if [[ -d "$PWD/$venv_dir" ]]; then
        source "$PWD/$venv_dir/bin/activate"
    fi
}
 
autoload -U add-zsh-hook
add-zsh-hook chpwd activate_venv_on_cd