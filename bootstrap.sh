#!/usr/bin/env bash

set -e

echo "🚀 Bootstrapping fresh macOS setup..."

# Install Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
  echo "📦 Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "⏳ Please complete the Xcode Command Line Tools installation in the dialog, then press any key to continue..."
  read -n 1 -s
else
  echo "✅ Xcode Command Line Tools already installed"
fi

if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✅ Homebrew already installed"
fi

# Install chezmoi
if ! command -v chezmoi &>/dev/null; then
  echo "🏠 Installing chezmoi..."
  brew install chezmoi
else
  echo "✅ chezmoi already installed"
fi

echo "📥 Initializing chezmoi with your dotfiles..."
chezmoi init "https://github.com/cschmatzler/dot.2025.git"

echo ""
read -n1 -p "[P]ersonal or [W]ork? " systemtype
echo ""
case $systemtype in
p | P)
  echo "🏠 Setting up for personal use..."
  mkdir -p ~/.config/chezmoi
  echo "[data]
personal = true
work = false" >~/.config/chezmoi/chezmoi.toml
  ;;
w | W)
  echo "💼 Setting up for work use..."
  mkdir -p ~/.config/chezmoi
  echo "[data]
personal = false
work = true" >~/.config/chezmoi/chezmoi.toml
  ;;
*)
  echo "❌ Invalid option, defaulting to personal..."
  mkdir -p ~/.config/chezmoi
  echo "[data]
personal = true
work = false" >~/.config/chezmoi/chezmoi.toml
  ;;
esac

echo "📦 Applying dotfiles configuration..."
chezmoi apply

echo "📦 Installing all packages..."
$HOME/.scripts/install

mkdir -p ~/Library/LaunchAgents

echo "🖥️  Setting up dock..."
$HOME/.scripts/setup-dock

echo "⚙️  Updating macOS settings..."
$HOME/.scripts/setup-macos

echo "🎉 Bootstrap complete! Your system is now fully configured."
