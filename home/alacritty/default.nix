{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./alacritty.yml;
  };

  home = {
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/alacritty"
      ];
    };
  };
}
