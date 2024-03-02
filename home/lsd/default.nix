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
      ignore-globs = [ 
        # mac bs
        "**/.DS_Store"
        ".Trash"
        ".cups"
        ".localized"

        # linux bs
        ".wget-hsts"
        ".nix-defexpr"
        ".pki"
        ".mozilla"
        ".hushlogin"
        ".manpath"
        ".nix-profile"
        ".steam"
        ".steampid"
        ".steampath"
        ".gtkrc-2.0"
      ];
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

  home = {
    shellAliases = {
      l = "lsd -lA";
    };
  };
}
