{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    tmux.enableShellIntegration = true;
  };
}
