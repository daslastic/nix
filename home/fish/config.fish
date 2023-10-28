fish_vi_key_bindings
fish_config theme choose fishsticks 

set fish_greeting
set -x fish_color_prefix "green"
set -x fish_color_idk "white"
set -x fish_color_suffix "yellow"
set -x fish_color_pwd "green"
set -x fish_prompt_pwd_dir_length 50

function fish_prompt -d "Write out the prompt"
  printf '%s%s%s %s%s%s\n%s ' \
    (set_color $fish_color_prefix)(whoami)\
    (set_color $fish_color_idk)@\
    (set_color $fish_color_suffix)(hostname)\
    (set_color $fish_color_pwd) (prompt_pwd) \
    (set_color "red"; fish_git_prompt) \
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
