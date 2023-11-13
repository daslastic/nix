{
  pkgs,
  nixpkgs,
  host,
  ...
}: 
{
  environment = {
    homeBinInPath = true;
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    shellAliases = {
      upgrade = "sudo nixos-rebuild switch --flake ~/.config/nix#${host}";
      update = "sudo nix flake update ~/.config/nix";
      cleanup = "sudo nix-collect-garbage -d";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
    };

    systemPackages = with pkgs; [
      curl
      eza
      killall
      ripgrep
      tree
      wget
      gzip
      killall
      rar
      ripgrep
      wget
      dysk
      bat
      dysk
      fd
      fx
      htop
      sd
      vimv
      ugrep
      neofetch
      hyperfine
      home-manager
    ];
  };

  system.stateVersion = "23.05";
}
