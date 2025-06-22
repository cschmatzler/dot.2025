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
chezmoi init --apply "https://github.com/cschmatzler/dot.2025.git"

echo "🔧 Installing mise tools..."
/opt/homebrew/bin/mise install

echo "🎉 Bootstrap complete! Your dotfiles are now applied."
