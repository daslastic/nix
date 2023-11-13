{
  user,
  config,
  ...
}: {
  xdg = {
    enable = true;
    userDirs = {
      createDirectories = false;
      desktop = "${config.home.homeDirectory}/des";
      documents = "${config.home.homeDirectory}/dox";
      download = "${config.home.homeDirectory}/dow";
      videos = "${config.home.homeDirectory}/vid";
      music = "${config.home.homeDirectory}/mus";
      pictures = "${config.home.homeDirectory}/pix";
      publicShare = "${config.home.homeDirectory}/pub";
      templates = "${config.home.homeDirectory}/pub";
    };
  };
}
