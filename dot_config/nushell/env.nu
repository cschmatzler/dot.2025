# Nushell Environment Configuration

# This file is loaded before config.nu and is used for environment variables
# that need to be available to all processes spawned from nushell

# Starship prompt
$env.STARSHIP_SHELL = "nu"
$env.PROMPT_COMMAND = { starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)' }
$env.PROMPT_COMMAND_RIGHT = { starship prompt --right --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)' }

# Vi mode indicators (remove default colon)
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

