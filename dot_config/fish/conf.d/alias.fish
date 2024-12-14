alias .. "cd .."
alias ... "cd ../.."

alias a aerc
alias b bat
alias d docker
alias e eza
alias el "eza --long"
alias et "eza --tree"
alias k kubectl
alias kx kubectx
alias ld lazydocker
alias lg lazygit
alias m mise
alias t task
alias tf terraform
alias v nvim
alias vim nvim

abbr -a -g c clear

abbr -a -g dcu "docker compose up -d"
abbr -a -g dcud "docker compose -f docker-compose.dev.yml up -d"

# git
# ---
set _git_log_oneline_format "%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n"
set _git_log_medium_format "%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B"

alias g git

# Branch
alias gb "git branch"
alias gbc "git switch -c"
alias gbs "git switch"

# Log
alias gl "git log --topo-order --pretty=format:"$_git_log_medium_format""
alias glo "git log --topo-order --pretty=format:"$_git_log_oneline_format""

# Fetch
alias gf "git fetch"
alias gfc "git clone"
alias gfp "git pull"

# Push
alias gp "git push"
alias gpf "git push --force-with-lease"
alias gpF "git push --force"

# Commit
alias gc "git commit"

# Working copy
alias gwr "git restore"
alias gws "git status --short"

# Index
alias gia "git add"
alias gid "git diff --cached"
alias gir "git reset"
alias giu "git add --update"

# Stash
alias gs "git stash"
alias gsa "git stash apply"
alias gsd "git stash drop"
alias gsp "git stash pop"
