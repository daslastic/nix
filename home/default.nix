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

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      l = "lsd -la";
      ls = "lsd";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      upgrade = "sudo nixos-rebuild switch --flake ~/.config/nix#${host}";
      update = "sudo nix flake update ~/.config/nix";
      cleanup = "sudo nix-collect-garbage -d";
    };

    packages = with pkgs;
      [
        bat
        dysk
        fd
        fx
        fzf
        htop
        sd
        vimv
        ugrep
        neofetch
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
