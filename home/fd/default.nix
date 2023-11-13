{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  xdg.configFile = {
    "fd/ignore".source = ./ignore;
  };
}
