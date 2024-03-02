{
  pkgs,
  user,
  config,
  ...
}: {
  networking = {
    hostName = "notflix";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 25565 8099 8096 ];
    };
  };

  users.users = {
    ${user} = {
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
    };
    nginx.extraGroups = [ "acme" ];
  };

  nixpkgs.config.allowUnfree = true;

  security.acme = {
    acceptTerms = true;
    defaults.email = "daslastic@gmail.com";
  };

  services = {
    vaultwarden = {
      enable = true;
      config = {
        ROCKET_PORT = 8099;
        ROCKET_ADDRESS = "127.0.0.1";
      };
    };
    jellyfin = {
      openFirewall = true;
      enable = true;
    };
    nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedGzipSettings = true;

      virtualHosts = {
        "jellyfin.daslastic.xyz" = {
          onlySSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://127.0.0.1:8096";
          };
        };
        "auth.daslastic.xyz" = {
          onlySSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://127.0.0.1:8099";
          };
        };
      };
    };
  };

  environment = {
    systemPackages = [
      pkgs.mediainfo
      pkgs.jellyfin-ffmpeg
      pkgs.intel-gpu-tools
      pkgs.jdk17_headless
    ];

    persistence."/persist" = {
      hideMounts = true;
      directories = [
        "/var/lib/jellyfin"
        "/var/lib/acme"
        "/var/lib/bitwarden_rs"
        "/var/www"
        "/media"
      ];
    };
  };
}
