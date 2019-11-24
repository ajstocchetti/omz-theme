# user@hostname:cwd <git> [last_return_code] [timestamp]

# In order for the git icon to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).

# wrapping color/font formatting in %{<expression>%} tells ZSH
#   not to take up space for the formatting text
# setting colors: $fg_no_bold[color] or $fg[color]
# clear color with $reset_color or %{$reset_color%}
# %B -> start bold, %b -> stop bold

local iso_time=%D{%FT%T%z}
local iso_time_f="%{%B$fg[green]%}[$iso_time]%{%b$reset_color%}"

local ret_code_error="%(?..[%?] )"
local ret_code_error_f="%{$fg[red]%}${ret_code_error}%{$reset_color%}"

local at='%{%B$fg[yellow]%}@%{%b$reset_color%}'
local machine='%{%B$fg[yellow]%}%m:%{%b$reset_color%}'

local cwd='%~'
local cwd_f='%{%B$fg[blue]%}$cwd%{%b$reset_color%}'

local user_name='%{%B$fg[magenta]%}%n%{$b$reset_color%}'
local user_symbol='» '
if [[ $UID -eq 0 ]]; then
  # user is root
  # local user_name='%{$fg_bold[red]%}%n%{$b$reset_color%}'
  local user_symbol='# '
fi
local user_symbol_f='%{$fg_bold[magenta]%}$user_symbol%{$reset_color%}'

local git_info='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'


PROMPT="${user_name}${at}${machine}${cwd_f} ${git_info}${ret_code_error_f}${iso_time_f}
$user_symbol_f"
# RPS1=$ret_code_error_f


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
