
# ─────────────────────────────────────────────────────────────────────────────
#  Rosé Pine • Dawn  –  Nushell theme (official palette keys only)
# ─────────────────────────────────────────────────────────────────────────────

# 1.  Palette ────────────────────────────────────────────────────────────────
let theme = {
  base          : "#faf4ed"
  surface       : "#fffaf3"
  overlay       : "#f2e9e1"
  muted         : "#9893a5"
  subtle        : "#797593"
  text          : "#575279"

  love          : "#b4637a"
  gold          : "#ea9d34"
  rose          : "#d7827e"
  pine          : "#286983"
  foam          : "#56949f"
  iris          : "#907aa9"

  highlightLow  : "#f4ede8"
  highlightMed  : "#dfdad9"
  highlightHigh : "#cecacd"
}

# 2.  Semantic short-hand (used later) ───────────────────────────────────────
let scheme = {
  recognized_command   : $theme.iris
  unrecognized_command : $theme.text
  constant             : $theme.gold
  punctuation          : $theme.subtle
  operator             : $theme.foam
  string               : $theme.pine
  virtual_text         : $theme.muted
  variable             : { fg: $theme.love attr: i }
  filepath             : $theme.gold
}

# 3.  colour_config  (same field list as Catppuccin example) ─────────────────
$env.config.color_config = {
  separator                 : { fg: $theme.muted attr: b }
  leading_trailing_space_bg : { fg: $theme.iris attr: u }
  header                    : { fg: $theme.text attr: b }
  row_index                 : $scheme.virtual_text

  record : $theme.text
  list   : $theme.text
  hints  : $scheme.virtual_text
  search_result : { fg: $theme.base bg: $theme.gold }

  shape_closure           : $theme.foam
  closure                 : $theme.foam
  shape_flag              : { fg: $theme.love attr: i }
  shape_matching_brackets : { attr: u }
  shape_garbage           : $theme.love
  shape_keyword           : $theme.iris
  shape_match_pattern     : $theme.pine
  shape_signature         : $theme.foam

  shape_table  : $scheme.punctuation
  cell-path    : $scheme.punctuation
  shape_list   : $scheme.punctuation
  shape_record : $scheme.punctuation
  shape_vardecl  : $scheme.variable
  shape_variable : $scheme.variable

  empty : { attr: n }

  # filesize gradient
  filesize: {||
    if $in < 1kb       { $theme.foam }
    else if $in < 10kb { $theme.pine }
    else if $in < 100kb{ $theme.gold }
    else if $in < 10mb { $theme.rose }
    else if $in < 100mb{ $theme.love }
    else if $in < 1gb  { $theme.love }
    else               { $theme.iris }
  }

  # duration gradient
  duration: {||
    if $in < 1day { $theme.foam }
    else if $in < 1wk { $theme.pine }
    else if $in < 4wk { $theme.gold }
    else if $in < 12wk{ $theme.rose }
    else if $in < 24wk{ $theme.love }
    else if $in < 52wk{ $theme.love }
    else              { $theme.iris }
  }

  # date gradient
  date: {|| (date now) - $in |
    if $in < 1day { $theme.foam }
    else if $in < 1wk { $theme.pine }
    else if $in < 4wk { $theme.gold }
    else if $in < 12wk{ $theme.rose }
    else if $in < 24wk{ $theme.love }
    else if $in < 52wk{ $theme.love }
    else              { $theme.iris }
  }

  shape_external          : $scheme.unrecognized_command
  shape_internalcall      : $scheme.recognized_command
  shape_external_resolved : $scheme.recognized_command
  shape_block             : $scheme.recognized_command
  block                   : $scheme.recognized_command

  shape_custom : $theme.rose
  custom       : $theme.rose

  # foreground / background / cursor
  background : $theme.base
  foreground : $theme.text
  cursor     : { bg: $theme.rose fg: $theme.base }

  # operators
  shape_range       : $scheme.operator
  range             : $scheme.operator
  shape_pipe        : $scheme.operator
  shape_operator    : $scheme.operator
  shape_redirection : $scheme.operator

  # paths & globs
  glob                     : $scheme.filepath
  shape_directory          : $scheme.filepath
  shape_filepath           : $scheme.filepath
  shape_glob_interpolation : $scheme.filepath
  shape_globpattern        : $scheme.filepath

  # primitives
  shape_int      : $scheme.constant
  int            : $scheme.constant
  bool           : $scheme.constant
  float          : $scheme.constant
  nothing        : $scheme.constant
  binary         : $scheme.constant
  shape_nothing  : $scheme.constant
  shape_bool     : $scheme.constant
  shape_float    : $scheme.constant
  shape_binary   : $scheme.constant
  shape_datetime : $scheme.constant
  shape_literal  : $scheme.constant

  # strings
  string                     : $scheme.string
  shape_string               : $scheme.string
  shape_string_interpolation : $theme.love
  shape_raw_string           : $scheme.string
  shape_externalarg          : $scheme.string
}

# 4.  Misc extras ────────────────────────────────────────────────────────────
$env.config.highlight_resolved_externals = true

$env.config.explore = {
  status_bar_background : { fg: $theme.text bg: $theme.surface }
  command_bar_text      : { fg: $theme.text }
  highlight             : { fg: $theme.base bg: $theme.gold }
  status : {
    error : $theme.love
    warn  : $theme.gold
    info  : $theme.iris
  }
  selected_cell         : { bg: $theme.iris fg: $theme.base }
}
