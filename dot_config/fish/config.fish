set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]
for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end
if status is-interactive && ! functions --query fisher
    curl --silent --location https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

if status is-interactive
    set -U FZF_COMPLETE 0
    set fish_greeting
    fish_vi_key_bindings

    starship init fish | source
    zoxide init fish --hook prompt | source
    atuin init fish --disable-up-arrow --disable-ctrl-r | source
    mise activate fish --shims | source
end
