{
  user,
  pkgs,
  config,
  host,
  nixpkgs,
  ...
}: {
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      dc = "sl";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      upgrade = "sudo nixos-rebuild switch --flake ~/.config/nix#${host}";
      update = "sudo nix flake update ~/.config/nix";
      cleanup = "sudo nix-collect-garbage -d";
      tree = "tree -C";
    };

    packages = with pkgs;
      [
        xdg-user-dirs

        sl
        cmatrix
        asciiquarium
        lolcat
      ];
  };
}
