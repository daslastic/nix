{
  user,
  pkgs,
  config,
  host,
  nixpkgs,
  ...
}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/";
      documents = "${config.home.homeDirectory}/";
      download = "${config.home.homeDirectory}/dow";
      videos = "${config.home.homeDirectory}/";
      music = "${config.home.homeDirectory}/";
      pictures = "${config.home.homeDirectory}/";
      publicShare = "${config.home.homeDirectory}/";
      templates = "${config.home.homeDirectory}/";
    };
  };

  home = {
    persistence."/persist/home/${user}" = {
      directories = [
        "dow"
      ];
      allowOther = true;
    };
  };
}
