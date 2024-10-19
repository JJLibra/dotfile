#!/bin/zsh

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

echo "Installing essential Zsh plugins..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh-My-Zsh not found. Please install it before running this script."
  exit 1
fi

if ! command -v eza &> /dev/null; then
  echo "Installing eza..."
  apt install -y gpg
  mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list
  chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  apt update && apt install -y eza
else
  echo "eza already installed, skipping..."
fi

echo "Adding additional plugin configuration to .zshrc..."
cat << 'EOF' >> "$HOME/.zshrc"

alias c="clear"

# Alias for ls replacement: eza
alias ls="eza --icons"
alias ll="eza --icons --long --header"
alias la="eza --icons --long --header --all"
alias lg="eza --icons --long --header --all --git"
alias tree="eza --icons --tree"
EOF

# Reload Zsh configuration
echo "Reloading Zsh configuration..."
source $HOME/.zshrc

echo "Installation complete! Please restart your terminal or log out and back in to apply the changes."