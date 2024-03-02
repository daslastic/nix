{
  pkgs,
  user,
  config,
  lib,
  ...
}: 
{
  
  programs = {
    gamemode.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryFlavor = "qt";
    };
    steam.enable = true;
    nix-ld.enable = true;
  };

  services = {
    ofono.enable = true;
    greetd = {
      enable = true;
      restart = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.river}/bin/river";
          user = "daslastic";
        };
        default_session = initial_session;
      };
    };
  };

  qt = {
    enable = true;
    style = "adwaita-dark";
  };

  xdg.portal.wlr.enable = true;

  environment = {
    systemPackages = with pkgs; [
      (lemon.retroarch.override {
        cores = [
          lemon.libretro.dolphin
          lemon.libretro.dosbox-pure
          lemon.libretro.pcsx2
          lemon.libretro.genesis-plus-gx
          lemon.libretro.snes9x
          lemon.libretro.beetle-psx-hw
          lemon.libretro.parallel-n64
          lemon.libretro.citra
          lemon.libretro.mgba
        ];
      })
      jellyfin-media-player
      #lemon.aseprite
      lemon.dolphin-emu
      lemon.pcsx2
      lemon.krita
      yuzu-mainline
    ];

    persistence."/persist" = {
      hideMounts = true;
      directories = [
      ];
    };
  };
}
