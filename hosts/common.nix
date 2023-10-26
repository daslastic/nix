{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./zfs.nix
      ./impermanence.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
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

  networking = {
    hostName = "${user}-${host}";
    networkmanager.enable = true;
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
    systemPackages = with pkgs; [
      curl
      eza
      killall
      neovim
      ripgrep
      tree
      wget
    ];
  };

  time.timeZone = "Eastern/Canada";

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services = {
    openssh.enable = true;
  };

  system.stateVersion = "23.11";
}
