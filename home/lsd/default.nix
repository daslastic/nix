{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.lsd = {
    enable = true;
    enableAliases = false;
    settings = {
      classic = false;
      sorting = {
        column = "name";
        reverse = false;
        dir-grouping = "first";
      };
      blocks = [ "permission" "user" "group" "date" "name" ];
      date = "+%b %d";
      dereference = false;
      display = "almost-all";
      ignore-globs = [ "**/.DS_Store" "**/.Trash" "**/.cups" "**./wget-hsts" "**/.localized" ];
      indicators = false;
      layout = "grid";
      size = "short";
      permission = "rwx";
      no-symlink = false;
      total-size = false;
      hyperlink = "never";
      symlink-arrow = "⇒ ";
      header = false;
    };
  };
}
