{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    mouse = true;
    prefix = "C-a";
    baseIndex = 1;
    disableConfirmationPrompt = true;
    customPaneNavigationAndResize = true;
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs; [ 
      tmuxPlugins.yank
    ];
  };

  home = {
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/tmux"
      ];
    };
  };
}
