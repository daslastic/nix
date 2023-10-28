{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config.fish;
  };

  home = {
    file.".config/fish/themes/fishsticks.theme".source = ./fishsticks.theme;
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/fish"
      ];
    };
  };
}
