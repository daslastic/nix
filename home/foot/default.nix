{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  xdg.configFile = {
    "foot/foot.ini".source = ./foot.ini;
  };

  home = {
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/foot"
      ];
    };
  };
}
