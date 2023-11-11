{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  home = {
    file.".config/fd/ignore".source = ./ignore;
  };
}
