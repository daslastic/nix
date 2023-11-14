fish_vi_key_bindings
fish_config theme choose fishsticks 

# fzf
set -x fzf_cmd 'cd $(fd --type d . ~ --hidden | fzf $FZF_DEFAULT_OPTS $fzf_directory_opts) && echo -e "\n" && fish_prompt'
set -x fish_clear 'clear; commandline -f repaint'
bind -M insert \cd '' # no
bind -M insert \cf $fzf_cmd
bind -M visual \cf $fzf_cmd
bind -M default \cf $fzf_cmd
bind -M insert \cs $fish_clear
bind -M visual \cs $fish_clear
bind -M default \cs $fish_clear

set -x FZF_DEFAULT_OPTS '--layout=reverse' '--preview-window=hidden' '--height=100%'
set -x fzf_directory_opts '--bind=ctrl-o:become($EDITOR {} &> /dev/tty)' '--layout=reverse-list' '--preview-window=hidden'
set -x fzf_fd_opts --hidden --type d . $HOME

# colorscheme
set -gx COLOR_WHITE         '#fbf1c7'
set -gx COLOR_GRAY          '#a89984'
set -gx COLOR_BLACK         '#000000'
set -gx COLOR_LIGHT_PURPLE  '#d3869b'
set -gx COLOR_DARK_PURPLE   '#b16286'
set -gx COLOR_CYAN          '#458588'
set -gx COLOR_GREEN         '#98971a'
set -gx COLOR_ORANGE        '#d65d0e'
set -gx COLOR_RED           '#cc241d'
set -gx COLOR_PINK          '#689d6a'
set -gx COLOR_YELLOW        '#d79921'

# prompt
set fish_greeting
set -x fish_color_prefix $COLOR_ORANGE
set -x fish_prompt_pwd_dir_length 50

function fish_prompt -d "Write out the prompt"
  printf '%s%s%s %s%s%s\n%s ' \
    (set_color $fish_color_prefix)(whoami)\
    (set_color $COLOR_GRAY)@\
    (set_color $COLOR_YELLOW)(hostname)\
    (set_color $COLOR_GREEN) (prompt_pwd) \
    (set_color $COLOR_RED; fish_git_prompt) \
    (set_color normal)🍺
end

set -g __fish_git_prompt_char_stagedstate " ●"
set -g __fish_git_prompt_char_dirtystate " ✚"
set -g __fish_git_prompt_char_untrackedfiles " …"
set -g __fish_git_prompt_char_conflictedstate " ✖"
set -g __fish_git_prompt_char_cleanstate " "

function __add_newline_after_command --on-event fish_postexec
  if test "$argv[1]" != "clear"
    printf "\n"
  end
end

function fish_mode_prompt; end;
