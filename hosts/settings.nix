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
    kernel.sysctl."kernel.sysrq" = 1;
  };

  users.users.${user} = {...}: {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel"];
  };

  networking = {
    networkmanager = {
      wifi.powersave = false;
      enable = true;
    };
    firewall.enable = false;
  };

  time.timeZone = "Eastern/Canada";
  security.polkit.enable = true;
  services = {
    openssh.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
  };
  nixpkgs.config.allowUnfree = true;
}
