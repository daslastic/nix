{
  pkgs,
  config,
  lib,
  user,
  ...
}: {
  boot.tmp.cleanOnBoot = true;
  services.gvfs.enable = true;
  services.envfs.enable = true;

  fileSystems."/persist".neededForBoot = true;

  # persisting user passwords
  # https://reddit.com/r/NixOS/comments/o1er2p/tmpfs_as_root_but_without_hardcoding_your/h22f1b9/
  users.mutableUsers = false;
  # create a password with for root and $user with:
  # mkpasswd -m sha-512 'PASSWORD' | sudo tee -a /persist/etc/shadow/root
  users.users.root.hashedPasswordFile = "/persist/etc/shadow/root";
  users.users.${user}.hashedPasswordFile = "/persist/etc/shadow/${user}";

  # setup persistence for home manager
  programs.fuse.userAllowOther = true;

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/etc/nixos"
      "/etc/NetworkManager"
    ];
    files = [
      "/etc/machine-id"
      "/etc/nix/id_rsa"
    ];
  };
}
