{
  config,
  user,
  lib,
  ...
}: {
    boot.tmp.cleanOnBoot = true;

    # root / home filesystem is destroyed and rebuilt on every boot:
    # https://grahamc.com/blog/erase-your-darlings
    boot.initrd.postDeviceCommands = lib.mkAfter ''
      "zfs rollback -r zroot/local/root@blank"}
      "zfs rollback -r zroot/safe/home@blank"}
    '';

    # fix directory permissions so home-manager doesn't error out
    systemd.services.fix-mount-permissions = {
      script = ''
        chown  ${user}:users /home/${user} && chmod 700 /home/${user}
      '';
      wantedBy = ["multi-user.target"];
    };

    # setup persistence for home manager
    programs.fuse.userAllowOther = true;
    fileSystems."/persist".neededForBoot = true;

    # persisting user passwords
    # https://reddit.com/r/NixOS/comments/o1er2p/tmpfs_as_root_but_without_hardcoding_your/h22f1b9/
    users.mutableUsers = false;
    # create a password with for root and $user with:
    # mkpasswd -m sha-512 'PASSWORD' | sudo tee -a /persist/etc/shadow/root
    users.users.root.hashedPasswordFile = "/persist/etc/shadow/root";
    users.users.${user}.hashedPasswordFile = "/persist/etc/shadow/${user}";

  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/etc/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
      { file = "/etc/nix/id_rsa"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
  };

}
