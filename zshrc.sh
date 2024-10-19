#!/bin/zsh

echo "Adding additional plugin configuration to .zshrc..."
cat << 'EOF' >> "$HOME/.zshrc"

alias c="clear"

# Alias for ls replacement: eza
alias ls="eza --icons"
alias ll="eza --icons --long --header"
alias la="eza --icons --long --header --all"
alias lg="eza --icons --long --header --all --git"
alias tree="eza --icons --tree"

# Alias for cd replacement: zoxide
eval "$(zoxide init --cmd cd zsh)"
alias cd=z

# >>> plugins configuration >>>
# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(bg=none,fg=magenta,bold)

# you-should-use
export YSU_MESSAGE_POSITION="after"
# <<< plugins configuration <<<
EOF

# Reload Zsh configuration
echo "Reloading Zsh configuration..."
source $HOME/.zshrc