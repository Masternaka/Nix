{ config, lib, pkgs, ... }:

####### Bien vérifier le nom des paquets dans https://search.nixos.org/packages avant #######
####### d'ajouter des paquets à cette liste. #######

{
  environment = {
      plasma6.excludePackages = with pkgs; [ 
        kdePackages.discover 

  ];
      programs.kdeconnect.enable = true;
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
        
  ];

}
