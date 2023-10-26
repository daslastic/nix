{
  pkgs,
  user,
  ...
}: {
  networking = {
    hostName = "notflix";
  };

  users.users.${user}.shell = pkgs.fish;

  programs.fish = {
    enable = true;
  };
}
