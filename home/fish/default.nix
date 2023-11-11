{
  pkgs,
  user,
  ...
}: {
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config.fish;
    plugins = [
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer;
      }
    ];
  };

  home = {
    file.".config/fish/themes/fishsticks.theme".source = ./fishsticks.theme;
      persistence."/persist/home/${user}" = {
      directories = [
        ".config/fish"
      ];
    };
  };
}
