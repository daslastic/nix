{
  config,
  lib,
  user,
  ...
}: {
  boot = {
    zfs.devNodes = lib.mkDefault "/dev/disk/by-id";
    supportedFilesystems = ["zfs"];
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  swapDevices = [
    { device = "/dev/disk/by-label/SWAP"; }
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

    "/media/movies" = {
      device = "poopy/movies";
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
      options = ["defaults" "size=4G" "mode=777"];
    };
  };
}
