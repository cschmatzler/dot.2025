function bootstrap --description 'Bootstrap a new machine'
    ~
    if test (count $argv) -eq 0
        echo "Usage: bootstrap [personal|work]"
        return 1
    end

    if test $argv[1] != personal; and test $argv[1] != work
        echo "Usage: bootstrap [personal|work]"
        return 1
    end

    and echo "Setting yadm config..."
    and yadm config class.local $argv[1]

    and echo "Pulling dotfiles..."
    and yadm pull --rebase

    and echo "Installing packages..."
    and cat $HOME/.config/brew/Brewfile.common $HOME/.config/brew/Brewfile.$argv[1] | brew bundle cleanup --force --file=-
    and cat $HOME/.config/brew/Brewfile.common $HOME/.config/brew/Brewfile.$argv[1] | brew bundle --file=-
    and brew upgrade --fetch-HEAD

    and echo "Updating fish..."
    and fish -c "fisher update"
    and fish -c fish_update_completions

    and echo "Installing runtimes..."
    and fish -c "mise i"

    and echo "Updating nvim plugins..."
    and nvim --headless "+Lazy! sync" +qa

    and echo "Updating bat..."
    and bat cache --build

    and echo "Linking docker plugins..."
    and mkdir -p ~/.docker/cli-plugins
    and ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose $HOME/.docker/cli-plugins/docker-compose

    echo "Configuring macOS..."
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool false
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
    defaults write NSGlobalDomain AppleFontSmoothing -int 2
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
    defaults write com.apple.screencapture location -string "~/Downloads"
    defaults write com.apple.screencapture type -string png
    defaults write com.apple.finder DisableAllAnimations -bool true
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.finder QLEnableTextSelection -bool true
    defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
    defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
    defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    defaults write com.apple.finder FXDefaultSearchScope -string SCcf
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
    defaults write com.apple.finder EmptyTrashSecurely -bool true
    defaults write com.apple.dock launchanim -bool false
    defaults write com.apple.Dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0
    defaults write com.apple.dock autohide -bool true
    chflags nohidden ~/Library
    defaults write com.apple.finder FXPreferredViewStyle -string clmv
    defaults write com.apple.dock tilesize -int 35
    defaults write com.apple.dock magnification -int 1
    defaults write com.apple.dock largesize -int 85
    defaults write com.apple.dock expose-animation-duration -float 0.15
    defaults write com.apple.dock mru-spaces -bool false
    defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
    defaults write com.apple.ActivityMonitor ShowCategory -int 0
    defaults write org.alacritty AppleFontSmoothing -int 0
    defaults -currentHost write -g AppleFontSmoothing -int 0
    killall Finder
    killall Dock
end
