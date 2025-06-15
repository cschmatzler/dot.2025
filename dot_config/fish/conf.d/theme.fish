# TokyoNight Color Palette
set -l foreground 3760bf
set -l selection b7c1e3
set -l comment 848cb5
set -l red f52a65
set -l orange b15c00
set -l yellow 8c6c3e
set -l green 587539
set -l purple 7847bd
set -l cyan 007197
set -l pink 9854f1

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $pink
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#b7c1e3 \
  --color=bg:#d0d5e3 \
  --color=border:#4094a3 \
  --color=fg:#3760bf \
  --color=gutter:#d0d5e3 \
  --color=header:#b15c00 \
  --color=hl+:#188092 \
  --color=hl:#188092 \
  --color=info:#8990b3 \
  --color=marker:#d20065 \
  --color=pointer:#d20065 \
  --color=prompt:#188092 \
  --color=query:#3760bf:regular \
  --color=scrollbar:#4094a3 \
  --color=separator:#b15c00 \
  --color=spinner:#d20065 \
"
