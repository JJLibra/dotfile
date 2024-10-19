#!/bin/zsh

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

echo "Installing Powerlevel10k theme..."
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
THEME_DIR="$ZSH_CUSTOM/themes/powerlevel10k"

if [ -d "$THEME_DIR" ]; then
  echo "Powerlevel10k theme already installed, skipping..."
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$THEME_DIR"
fi

if grep -q '^ZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME/.zshrc"; then
  echo "Powerlevel10k theme is already set in .zshrc."
else
  sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc" \
    || echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$HOME/.zshrc"
fi

echo "Installation complete!"
echo "Please restart your terminal or log out and log back in to apply the changes."