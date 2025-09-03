{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #kdePackages.kate
    kio-extras
    merkuro
    dolphin-plugins
    kio-admin
    filelight
    isoimagewriter
    yakuake
    krusader
    systemdgenie
    kwrite
    print-manager
    ffmpegthumbs
    qt6-multimedia
    qt6-multimedia-gstreamer
    qt6-multimedia-ffmpeg
    qt6-wayland
    kdeplasma-addons
    plasma-systemmonitor
    kwalletmanager
    klassy
  ];

}
