{ config, lib, pkgs, ... }:

# Samba pour partager des fichiers sur le réseau

services.samba = {
    enable = true;
    openFirewall = true;
    nmbd.enable = true;
    workgroup = "WORKGROUP";
    serverString = "Desktop Samba NixOS";

    shares = {
      disque500 = {
        comment = "Disque 500";
        path = "/mnt/Disque500";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0640";
        directoryMask = "0750";
    };
      sauvegarde500 = {
        comment = "Sauvegarde 500";
        path = "/mnt/Backup500";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0640";
        directoryMask = "0750";
    };
      disque250 = {
        comment = "Disque 250";
        path = "/mnt/Disque250";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0640";
        directoryMask = "0750";
    };
      sauvegarde250 = {
        comment = "Sauvegarde 250";
        path = "/mnt/Backup250";
        browseable = true;
        guestOk = false;
        readOnly = false;
        validUsers = [ "gabriel" ];
        createMask = "0640";
        directoryMask = "0750";
          };
      };
  };
