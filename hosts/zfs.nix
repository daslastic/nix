{
  config,
  lib,
  user,
  ...
}: {
  boot.supportedFilesystems = ["zfs"];
  boot.zfs.devNodes = lib.mkDefault "/dev/disk/by-id";
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  networking.hostId = "89eaa833"; 

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  swapDevices = [
    {device = "/dev/disk/by-label/SWAP";}
  ];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };

    "/nix" = {
      device = "zroot/local/nix";
      fsType = "zfs";
    };

    "/tmp" = {
      device = "zroot/local/tmp";
      fsType = "zfs";
    };

    "/persist" = {
      device = "zroot/safe/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

    "/" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = ["defaults" "size=1G" "mode=755"];
    };

    "/home/${user}" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = ["defaults" "size=1G" "mode=777"];
    };
  };

  services.sanoid = {
    enable = true;

    datasets = {
      "zroot/safe/persist" = {
        hourly = 50;
        daily = 20;
        weekly = 6;
        monthly = 3;
      };
    };
  };
}
