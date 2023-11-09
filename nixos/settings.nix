{ config, user, host, pkgs, ... }:
{
  boot = {
    loader = {
      # systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
      }; 
    };
    tmp.cleanOnBoot = true;
  };

  users.users.${user} = {...}: {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel"];
  };

  networking = {
    hostId = "574f5b48";
    networkmanager = {
      wifi.powersave = false;
      enable = true;
    };
  };

  time.timeZone = "Eastern/Canada";
  security.polkit.enable = true;
  services = {
    openssh = {
      enable = true;
      openFirewall = true;
    };
    rsyncd = {
      enable = true;
    };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };
}
