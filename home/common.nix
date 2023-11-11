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
      l = "lsd -la";
      ls = "lsd";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      dc = "sl";
      upgrade = "sudo nixos-rebuild switch --flake ~/.config/nix#${host}";
      update = "sudo nix flake update ~/.config/nix";
      cleanup = "sudo nix-collect-garbage -d";
      tree = "tree -C";
    };

    packages = with pkgs;
      [
        sl
      ];
  };
}
