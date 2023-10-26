{
  pkgs,
  user,
  ...
}: {
  networking = {
    hostName = "notflix";
  };

  users.users.${user}.shell = pkgs.fish;

  services.jellyfin = {
    openFirewall = true;
    enable = true;
  };

  programs.fish = {
    enable = true;
  };
}
