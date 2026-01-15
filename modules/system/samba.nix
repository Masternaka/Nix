{ config, lib, pkgs, ... }:

{
  services.samba = {
    package = pkgs.samba4Full;
    enable = true;
    openFirewall = true;
    securityType = "user";

    extraConfig = ''
      workgroup = WORKGROUP
      server string = sambanix
      netbios name = sambanix

      # Support pour Time Machine et macOS
      fruit:aapl = yes
      fruit:time machine = yes
      vfs objects = catia fruit streams_xattr
    '';

    shares = {
      disque500 = {
        comment = "Disque 500";
        path = "/mnt/Disque500";
        browseable = "yes";
        "guest ok" = "no";
        "read only" = "no";
        "valid users" = "gabriel";
        "create mask" = "0644";
        "directory mask" = "0755";
      };

      sauvegarde500 = {
        comment = "Sauvegarde 500";
        path = "/mnt/Backup500";
        browseable = "yes";
        "guest ok" = "no";
        "read only" = "no";
        "valid users" = "gabriel";
        "create mask" = "0644";
        "directory mask" = "0755";
      };

      disque250 = {
        comment = "Disque 250";
        path = "/mnt/Disque250";
        browseable = "yes";
        "guest ok" = "no";
        "read only" = "no";
        "valid users" = "gabriel";
        "create mask" = "0644";
        "directory mask" = "0755";
      };

      sauvegarde250 = {
        comment = "Sauvegarde 250";
        path = "/mnt/Backup250";
        browseable = "yes";
        "guest ok" = "no";
        "read only" = "no";
        "valid users" = "gabriel";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };

  # Service de découverte WS-Discovery pour Windows
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Service Avahi pour la découverte réseau (Bonjour/Zeroconf)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}
