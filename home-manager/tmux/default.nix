{
  config,
  lib,
  pkgs,
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
  };
}
