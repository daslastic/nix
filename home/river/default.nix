{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  xdg.configFile = {
    "river/init" = {
      source = ./init;
      executable = true;
    };
  };

  home = {
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/river"
      ];
    };
  };
}
