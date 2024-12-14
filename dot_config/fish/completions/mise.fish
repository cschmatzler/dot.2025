if ! set -q _usage_spec_mise_2024_12_9
    set -g _usage_spec_mise_2024_12_9 (mise usage | string collect)
end
complete -xc mise -a '(usage complete-word --shell fish -s "$_usage_spec_mise_2024_12_9" -- (commandline -cop) (commandline -t))'
