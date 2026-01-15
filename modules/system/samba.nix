{ config, lib, pkgs, ... }:

# Samba pour partager des fichiers sur le réseau
{
  services.samba = {
    package = pkgs.samba4Full;
    usershares.enable = true;
    enable = true;
    openFirewall = true;
    nmbd.enable = true;
    workgroup = "WORKGROUP";
    serverString = "sambanix";
    netbiosName = "sambanix";
    security = "user";
    "fruit:aapl" = "yes";
    "fruit:time machine" = "yes";
    "vfs objects" = "catia fruit streams_xattr";
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.avahi = {
    publish.enable = true;
    publish.userServices = true;
    nssmdns4 = true;
    enable = true;
    openFirewall = true;
  };

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

    shares = {
      disque500 = {
        comment = "Disque 500";
        path = "/mnt/Disque500";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0644";
        directoryMask = "0755";
    };
      sauvegarde500 = {
        comment = "Sauvegarde 500";
        path = "/mnt/Backup500";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0644";
        directoryMask = "0755";
    };
      disque250 = {
        comment = "Disque 250";
        path = "/mnt/Disque250";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0644";
        directoryMask = "0755";
    };
      sauvegarde250 = {
        comment = "Sauvegarde 250";
        path = "/mnt/Backup250";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0644";
        directoryMask = "0755";
      };
    };
  };
} 