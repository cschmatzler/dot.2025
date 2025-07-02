# Environment
$env.PATH ++= [
  ($env.HOME | path join ".local" "bin"),
  ($env.HOME | path join ".scripts"),
  "/opt/homebrew/bin"
]

$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "ov"
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.ZK_NOTEBOOK_DIR = ($env.HOME | path join "Notebook")

# Nushell
source theme.nu
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.config = {
    show_banner: false
    edit_mode: vi,
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

# Plugins
source mise.nu
source starship.nu
source zoxide.nu
source atuin.nu

# Tools
$env.RIPGREP_CONFIG_PATH = ($env.HOME | path join ".config" "ripgrep" "config")
$env.FZF_COMPLETE = "0"
$env.FZF_DEFAULT_OPTS = "
--color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39
--color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78
--color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39
--color=selected-bg:#BCC0CC
--color=border:#CCD0DA,label:#4C4F69"

# Aliases 
alias .. = cd ..
alias ... = cd ../..
alias b = bat
alias d = docker
alias ld = lazydocker
alias lg = lazygit
alias m = mise
alias mr = mise run
alias v = nvim
alias vim = nvim
alias dcu = docker compose up -d
alias dcud = docker compose -f docker-compose.dev.yml up -d


# Aliases: Git
alias g = git
alias gb = git branch
alias gbc = git switch -c
alias gbs = git switch
alias gf = git fetch
alias gfc = git clone
alias gfp = git pull
alias gp = git push
alias gpf = git push --force-with-lease
alias gpF = git push --force
alias gc = git commit
alias gwr = git restore
alias gws = git status --short
alias gia = git add
alias gid = git diff --cached
alias gir = git reset
alias giu = git add --update
alias gs = git stash
alias gsa = git stash apply
alias gsd = git stash drop
alias gsp = git stash pop

# Functions
source functions/mkcd.nu
source functions/zg.nu
source functions/c.nu
