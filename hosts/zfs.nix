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

  fileSystems = let
      homeMountPoint = "/home/${user}";
  in {
    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };

    "/" = {
      device = "zroot/local/root";
      fsType = "zfs";
    };

    "/nix" = {
      device = "zroot/local/nix";
      fsType = "zfs";
    };

    "/tmp" = {
      device = "zroot/local/tmp";
      fsType = "zfs";
    };

    "${homeMountPoint}" = {
      device = "zroot/safe/home";
      fsType = "zfs";
    };

    "/persist" = {
      device = "zroot/safe/persist";
      fsType = "zfs";
    };
  };
}
