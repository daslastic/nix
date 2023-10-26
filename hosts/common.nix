{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./zfs.nix
      ./impermanence.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "${user}-${host}";
    networkmanager.enable = true;
    firewall.enable = false;
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
