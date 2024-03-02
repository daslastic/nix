{ config, user, host, pkgs, ... }:
{
 nixpkgs.config.permittedInsecurePackages = [
                "freeimage-unstable-2021-11-01"
              ];
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
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
    doas.enable =  true;
    doas.wheelNeedsPassword = false;
  };

  services = {
    mullvad-vpn.enable = true;
    openssh = {
      enable = true;
      openFirewall = true;
    };
    rsyncd = {
      enable = true;
    };
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [pavucontrol];

  hardware = {
    pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          FastConnectable = true;
        };
      };
    };
  };
}
