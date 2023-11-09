{
  pkgs,
  user,
  ...
}: {
  networking = {
    hostName = "notflix";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };

  users.users = {
    ${user} = {
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
    };
    nginx.extraGroups = [ "acme" ];
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "daslastic@gmail.com";
  };
  
  services = {
    vaultwarden = {
      enable = true;
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
        "daslastic.xyz" = {
          onlySSL = true;
          enableACME = true;
          root = "/var/www/daslastic.xyz";
        };
      };
    };
  };

  environment = {
    systemPackages = [
      pkgs.mediainfo
      pkgs.jellyfin-ffmpeg
      pkgs.intel-gpu-tools
    ];

    persistence."/persist" = {
      hideMounts = true;
      directories = [
        "/var/lib/jellyfin"
        "/var/lib/acme"
        "/var/lib/bitwarden_rs"
        "/media"
        "/var/www"
      ];
    };
  };
}
