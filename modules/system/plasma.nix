{ config, lib, pkgs, ... }:

####### Bien vérifier le nom des paquets dans https://search.nixos.org/packages avant #######
####### d'ajouter des paquets à cette liste. #######

services = {
  displayManager.sddm.enable = true;
  desktopManager.plasma6.enable = true;
  displayManager.sddm.wayland.enable = true;
  displayManager.autologin = {
    enable = false;
    user = "gabriel";
  };
};

xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
      xdgOpenUsePortal = true;
};

blueman.enable = true;

systemd.services."getty@tty1".enable = false;
systemd.services."autovt@tty1".enable = false;

programs.kdeconnect.enable = true;

environment = {
  systemPackages = with pkgs; [
    kdePackages.partitionmanager
    kdePackages.kpmcore
    #kio-extras
    #merkuro
    #dolphin-plugins
    #kio-admin
    #filelight
    #isoimagewriter
    #yakuake
    #krusader
    #systemdgenie
    #kwrite
    #print-manager
    #ffmpegthumbs
    #qt6-multimedia
    #qt6-multimedia-gstreamer
    #qt6-multimedia-ffmpeg
    #qt6-wayland
    #kdeplasma-addons
    #plasma-systemmonitor
    #kwalletmanager
    #klassy

  plasma6.excludePackages = with pkgs; [
    kdePackages.discover

  ];

}
