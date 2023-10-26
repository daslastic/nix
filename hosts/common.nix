{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./impermanence.nix
      ./zfs.nix
    ];

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


  networking = {
    networkmanager = {
      wifi.powersave = false;
      enable = true;
    };
    firewall.enable = false;
  };

  users.users.${user} = {...}: {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel"];
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
    shellAliases = {
      v = "nvim";
    };
    systemPackages = with pkgs; [
      curl
      eza
      killall
      neovim
      ripgrep
      tree
      wget
      gzip
      killall
      rar
      ripgrep
      wget
      home-manager
    ];
  };

  time.timeZone = "Eastern/Canada";

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
  };

  security.polkit.enable = true;
  services = {
    openssh.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  system.stateVersion = "23.05";
}
