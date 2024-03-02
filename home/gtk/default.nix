{
  user,
  pkgs,
  config,
  host,
  nixpkgs,
  ...
}: {
  gtk = {
    enable = true;
    cursorTheme.name = "Adwaita";
    iconTheme.name = "Adwaita";
    theme.name = "Adwaita-dark";
  };
}
