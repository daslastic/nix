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

  xdg.configFile = {
    "fish/themes/fishsticks.theme".source = ./fishsticks.theme;
  };

  home = {
    persistence."/persist/home/${user}" = {
      directories = [
        ".config/fish"
      ];
    };
  };
}
