$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "ov"
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.ZK_NOTEBOOK_DIR = ($env.HOME | path join "Notebook")
$env.RIPGREP_CONFIG_PATH = ($env.HOME | path join ".config" "ripgrep" "config")

$env.PATH = ($env.PATH | split row (char esep) | prepend [
    ($env.HOME | path join ".local" "bin")
    ($env.HOME | path join ".scripts")
    "/opt/homebrew/bin"
])

$env.FZF_COMPLETE = "0"

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

