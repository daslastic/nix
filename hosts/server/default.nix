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
   # certs."daslastic.xyz" = {
   #   dnsProvider = "cloudflare";
   #   credentialsFile = /persist/etc/shadow/auth;
   #   group = "nginx";
   #   extraDomainNames = [
   #     "*.daslastic.xyz"
   #   ];
   # };
  };
  
  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud27;
      hostName = "cloud.daslastic.xyz";
      https = true;
      configureRedis = true;
      config.adminpassFile = "/persist/etc/shadow/nextcloud";
      extraOptions.enabledPreviewProviders = [
        "OC\\Preview\\BMP"
        "OC\\Preview\\GIF"
        "OC\\Preview\\JPEG"
        "OC\\Preview\\Krita"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\MP3"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\PNG"
        "OC\\Preview\\TXT"
        "OC\\Preview\\XBitmap"
        "OC\\Preview\\HEIC"
      ];
    };
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
        "daslastic.xyz" = {
          onlySSL = true;
          enableACME = true;
          root = "/var/www/daslastic.xyz";
        };
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
        ${config.services.nextcloud.hostName} = {
          forceSSL = true;
          enableACME = true;
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
        "/var/lib/nextcloud"
        "/var/lib/bitwarden_rs"
        "/var/www"
        "/media"
      ];
    };
  };
}
