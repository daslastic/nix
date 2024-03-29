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
      ./xdg
      ./gtk

      ./alacritty
      ./tofi
      ./river
      ./foot

      ./bin
      ./fish
      ./git
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
    command-not-found.enable = false;
    nix-index = {
      enable = false;
      enableFishIntegration = false;
    };
  };

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    file.".hushlogin".text = "";
    persistence."/persist/home/${user}" = {
      directories = [
        ".gnupg"
        ".ssh"
        ".config/nix"
        ".config/google-chrome"
        ".mozilla"
        ".local/state/wireplumber"
      ];
      allowOther = true;
    };

    stateVersion = "24.05";
  };
}
