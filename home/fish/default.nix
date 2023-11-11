{
  pkgs,
  user,
  ...
}: {
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config.fish;

    shellAbbrs = {
      cp = "cp -ivr";
      mkdir = "mkdir -p";
      rm = "rm -vI";
      mv = "mv -iv";
      scp = "scp -r";
    };

    shellAliases = {
      colorscript = "sh $(find $HOME/.config/fish/colorscripts -type f | shuf -n1)";
    };

    plugins = [
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer.src;
      }
    ];
  };

  home = {
    file = {
      ".config/fish/themes/fishsticks.theme".source = ./fishsticks.theme;
      ".config/fish/colorscripts".source = ./colorscripts;
    };

    persistence."/persist/home/${user}" = {
      directories = [
        ".config/fish"
      ];
    };
  };
}
