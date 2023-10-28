{
  pkgs,
  config,
  lib,
  user,
  ...
}: {
  boot.tmp.cleanOnBoot = true;
  services = {
    gvfs.enable = true;
    envfs.enable = true;
  };

  fileSystems."/persist".neededForBoot = true;

  systemd.services.fix-mount-permissions = {
    script = ''
      chown  ${user}:users /home/${user} && chmod 700 /home/${user}
    '';
    wantedBy = ["multi-user.target"];
  };

  users = {
    mutableUsers = false;
    # create a password with for root and $user with:
    # mkpasswd -m sha-512 'PASSWORD' | sudo tee -a /persist/etc/shadow/root
    users = {
      root.hashedPasswordFile = "/persist/etc/shadow/root";
      ${user}.hashedPasswordFile = "/persist/etc/shadow/${user}";
    };
  };

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
    ];
  };
}
