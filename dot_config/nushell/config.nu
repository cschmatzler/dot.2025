# Environment
$env.PATH = [
  ($env.HOME | path join ".local" "bin"),
  ($env.HOME | path join ".scripts"),
  "/opt/homebrew/bin"
] ++ $env.PATH

$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "ov"
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.ZK_NOTEBOOK_DIR = ($env.HOME | path join "Notebook")

let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}

# Nushell
source theme.nu
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.config = {
    show_banner: false
    edit_mode: vi,
    completions: {
        external: {
            enable: true
            completer: $fish_completer
        }
    }
}

# Plugins
source mise.nu
source starship.nu
source zoxide.nu
source atuin.nu

# Tools
$env.LS_COLORS = (vivid generate catppuccin-latte | str trim)
$env.RIPGREP_CONFIG_PATH = ($env.HOME | path join ".config" "ripgrep" "config")
$env.FZF_COMPLETE = "0"
$env.FZF_DEFAULT_OPTS = "
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 
--color=selected-bg:#494D64 
--color=border:#363A4F,label:#CAD3F5"

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

