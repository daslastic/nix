{
  pkgs,
  nixpkgs,
  host,
  ...
}: 
{
  programs = {
    firefox.enable = true;
  };

  environment = {
    homeBinInPath = true;
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIX_BUILD_CORES = "0";
    };

    shellAliases = {
      upgrades = "sudo nixos-rebuild switch --flake ~/.config/nix#${host}";
      upgrade = "sudo nixos-rebuild boot --flake ~/.config/nix#${host}";
      update = "sudo nix flake update ~/.config/nix";
      cleanup = "sudo nix-collect-garbage -d";
      # v = "nvim";
      # vi = "nvim";
      # vim = "nvim";
    };

    systemPackages = with pkgs; [

      alacritty

      google-chrome
      mullvad-vpn
      qbittorrent
      curl
      mpv
      neovim
      eza
      killall
      ripgrep
      tree
      wget
      gzip
      killall
      (gcc.overrideAttrs (oldAttrs: {
        configureFlags = oldAttrs.configureFlags or [] ++ ["--enable-lto"];
      }))
      rar
      ripgrep
      wget
      bat
      dysk
      fd
      htop
      sd
      vimv
      ugrep
      neofetch
      hyperfine
      home-manager
      zip
      unzip
      p7zip
    ];
  };
  
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];

  system.stateVersion = "24.05";
}
