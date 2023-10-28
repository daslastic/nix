{
  pkgs,
  ...
}: 
{
  environment = {
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
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
      home-manager
    ];
  };

  system.stateVersion = "23.05";
}
