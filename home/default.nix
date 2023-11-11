{
  user,
  pkgs,
  config,
  host,
  nixpkgs,
  ...
}: {
  imports =
    [
      ./fish
      ./tmux
      ./lsd
      ./fzf
      ./fd
      ./common.nix
    ];

  fonts.fontconfig.enable = true;
  systemd.user.startServices = true;
  nix.registry.nixpkgs.flake = nixpkgs;

  programs = {
    git = {
      enable = true;
      userName  = "daslastic";
      userEmail = "daslastic@gmail.com";
    };
    command-not-found.enable = false;
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  home = {
    file.".hushlogin".text = "";

    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

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
