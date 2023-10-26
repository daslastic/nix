{
  user,
  pkgs,
  config,
}: {
  fonts.fontconfig.enable = true;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    packages = with pkgs;
      [
        curl
        gzip
        killall
        neovim
        rar
        ripgrep
        wget
        home-manager
      ];

    persistence."/persist/home/${user}" = {
      directories = [
        ".gnupg"
        ".ssh"
      ];
      allowOther = true;
    };
  };
}
