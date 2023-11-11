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

# prompt
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
