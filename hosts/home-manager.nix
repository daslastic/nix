{
  user,
  pkgs,
  config,
  host,
  ...
}: {
  fonts.fontconfig.enable = true;
  systemd.user.startServices = true;

  programs = {
    git = {
      enable = true;
      userName  = "daslastic";
      userEmail = "daslastic@gmail.com";
    };
    fish = {
      enable = true;
    };
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
    command-not-found.enable = false;
    lsd = {
      enable = true;
      enableAliases = false;
      settings = {
        classic = false;
        blocks = [ "permission" "user" "date" "name" ];
        date = "+%b %d";
        dereference = false;
        display = "almost-all";
        ignore-globs = [ "**/.DS_Store" "**/.Trash" "**/.cups" "**./wget-hsts" "**/.localized" "." ".." ];
        indicators = false;
        layout = "grid";
        size = "short";
        permission = "rwx";
      };
    };
  };

  home = {
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
