$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "ov"
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.ZK_NOTEBOOK_DIR = ($env.HOME | path join "Notebook")
$env.RIPGREP_CONFIG_PATH = ($env.HOME | path join ".config" "ripgrep" "config")
$env.FZF_DEFAULT_OPTS = "
	--color=fg:$subtle,bg:$base,hl:$rose
	--color=fg+:$text,bg+:$overlay,hl+:$rose
	--color=border:$highlightMed,header:$pine,gutter:$base
	--color=spinner:$gold,info:$foam
	--color=pointer:$iris,marker:$love,prompt:$subtle"

$env.PATH = ($env.PATH | split row (char esep) | prepend [
    ($env.HOME | path join ".local" "bin")
    ($env.HOME | path join ".scripts")
    "/opt/homebrew/bin"
])

$env.FZF_COMPLETE = "0"

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

