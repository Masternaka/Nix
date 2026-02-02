{ config, lib, pkgs, ... }:

{

  # Enable networking
  networking.networkmanager.enable = true;

  # Service de découverte WS-Discovery pour Windows
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Service GVFS pour la gestion des volumes montés
  services.gvfs.enable = true;

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
