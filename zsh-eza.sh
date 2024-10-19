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

echo "Installation complete! Please restart your terminal or log out and back in to apply the changes."
