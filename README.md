# Dotfiles

My personal dotfiles managed with [chezmoi](https://chezmoi.io/).

## Fresh macOS Setup

For a fresh macOS installation, run this one-liner to bootstrap everything:

```bash
curl -fsSL https://raw.githubusercontent.com/cschmatzler/dot.2025/main/bootstrap.sh | bash
```

This will:
1. Install Xcode Command Line Tools
2. Install Homebrew
3. Install chezmoi
4. Clone and apply your dotfiles
5. Install mise tools (before fish shell initialization)

## Manual Setup

If you prefer to set up manually:

```bash
# Install chezmoi
brew install chezmoi

# Initialize with your dotfiles
chezmoi init --apply https://github.com/cschmatzler/dot.2025.git

# Run the install script for additional setup
~/.scripts/install
```

## What's Included

- **Shell**: Fish shell with custom configuration
- **Editor**: Neovim with LazyVim
- **Terminal**: Ghostty configuration
- **Git**: Custom git configuration and aliases
- **Development Tools**: mise for version management
- **macOS Settings**: Dock, Finder, and system preferences
- **Homebrew**: Package management with Brewfiles for personal/work setups

## Structure

- `dot_config/`: Application configurations
- `dot_scripts/`: Utility scripts including the main install script
- `bootstrap.sh`: Fresh system bootstrap script

## Usage

After initial setup, use these commands:

```bash
# Update dotfiles
chezmoi update

# Edit a config file
chezmoi edit ~/.config/fish/config.fish

# Apply changes
chezmoi apply

# Run full install/upgrade
~/.scripts/install
```