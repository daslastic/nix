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
    terminal = "tmux-256color";
    mouse = true;
    prefix = "C-a";
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs; [ 
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
