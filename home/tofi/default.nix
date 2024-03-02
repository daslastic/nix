{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  xdg.configFile = {
    "tofi/config".source = ./config;
  };

  home = {
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/tofi"
      ];
    };
  };
}
