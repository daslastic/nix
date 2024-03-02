{
  pkgs,
  config,
  lib,
  user,
  ...
}: {
  home = {
    persistence."/persist/home/${user}" = {
      directories = [
        ".config/retroarch"
        ".config/Mullvad\ VPN"
        ".config/Cemu"
        ".local/share/yuzu"
        ".config/yuzu"
        ".config/PCSX2"
        ".local/share/Steam"
        ".local/share/Mullvad\ VPN"
        ".local/share/jellyfinmediaplayer"
        ".config/jellyfin.org"
        ".local/share/Jellyfin\ Media\ Player"
        ".local/share/dolphin-emu"
        ".config/dolphin-emu"
      ];
      allowOther = true;
    };
    packages = with pkgs; [
    ];
  };
}
