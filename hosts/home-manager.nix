{
  user,
  pkgs,
  config,
  ...
}: {
  fonts.fontconfig.enable = true;
  systemd.user.startServices = true;

  programs.git = {
    enable = true;
    userName  = "daslastic";
    userEmail = "daslastic@gmail.com";
  };

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    packages = with pkgs;
      [
      ];

    persistence."/persist/home/${user}" = {
      directories = [
        ".gnupg"
        ".ssh"
        ".config/nix"
      ];
      allowOther = true;
    };
  };
}
