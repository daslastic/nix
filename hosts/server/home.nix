{
  pkgs,
  config,
  lib,
  user,
  ...
}: {
  home = {
    persistence."/persist/home/${user}" = {
      directories = [
      ];
      allowOther = true;
    };
  };
}
