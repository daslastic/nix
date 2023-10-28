{
  pkgs,
  user,
  ...
}: {
  networking = {
    hostName = "notflix";
  };

  users.users.${user} = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  services.jellyfin = {
    openFirewall = true;
    enable = true;
  };

  environment = {
    systemPackages = [
      pkgs.mediainfo
      pkgs.jellyfin-ffmpeg
      pkgs.intel-gpu-tools
    ];

    persistence."/persist" = {
      hideMounts = true;
      directories = [
        "/media"
        "/var/lib/jellyfin"
      ];
    };
  };
}
