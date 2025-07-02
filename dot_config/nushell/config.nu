# Nushell Configuration

# Configuration
$env.config = {
    show_banner: false
    edit_mode: vi
    keybindings: [
        {
            name: atuin_ctrl_h
            modifier: control
            keycode: char_h
            mode: [emacs, vi_normal, vi_insert]
            event: { send: executehostcommand cmd: "atuin search --interactive" }
        }
    ]
}

mkdir ($nu.user-autoload-dirs | first)
if (which mise | is-not-empty) {
    mise activate nu | save -f ($nu.user-autoload-dirs | first | path join "mise.nu")
}
if (which starship | is-not-empty) {
    $env.STARSHIP_SHELL = "nu"
    starship init nu | save -f ($nu.user-autoload-dirs | first | path join "starship.nu")
}
if (which zoxide | is-not-empty) {
    zoxide init nushell | save -f ($nu.user-autoload-dirs | first | path join "zoxide.nu")
}
if (which atuin | is-not-empty) {
    atuin init nu | save -f ($nu.user-autoload-dirs | first | path join "atuin.nu")
}


# Aliases - Basic navigation
alias .. = cd ..
alias ... = cd ../..

# Aliases - Tools
alias b = bat
alias d = docker
alias e = eza
alias el = eza --long
alias et = eza --tree
alias k = kubectl
alias kx = kubectx
alias ld = lazydocker
alias lg = lazygit
alias m = mise
alias mr = mise run
alias tf = terraform
alias v = nvim
alias vim = nvim

# Docker aliases
alias dcu = docker compose up -d
alias dcud = docker compose -f docker-compose.dev.yml up -d

# Git aliases
let git_log_oneline_format = "%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n"
let git_log_medium_format = "%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae >%n%C(bold)Date:%C(reset) %C(blue)%ai (%ar)%C(reset)%n%+B"

alias g = git

# Branch
alias gb = git branch
alias gbc = git switch -c
alias gbs = git switch

# Log
def gl [] { git log --topo-order $"--pretty=format:($git_log_medium_format)" }
def glo [] { git log --topo-order $"--pretty=format:($git_log_oneline_format)" }

# Fetch
alias gf = git fetch
alias gfc = git clone
alias gfp = git pull

# Push
alias gp = git push
alias gpf = git push --force-with-lease
alias gpF = git push --force

# Commit
alias gc = git commit

# Working copy
alias gwr = git restore
alias gws = git status --short

# Index
alias gia = git add
alias gid = git diff --cached
alias gir = git reset
alias giu = git add --update

# Stash
alias gs = git stash
alias gsa = git stash apply
alias gsd = git stash drop
alias gsp = git stash pop

# Custom functions
def mkcd [dir: string] {
    mkdir $dir
    cd $dir
}

def zg [] {
    let git_root = (git rev-parse --show-toplevel | complete)
    if $git_root.exit_code == 0 {
        z ($git_root.stdout | str trim)
    } else {
        echo "Not in a git repository"
    }
}

# Clear command (equivalent to fish abbr)
def c [] { clear }
