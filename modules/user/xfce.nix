{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    mugshot
    xfce4-appfinder
    xfce4-calculator-plugin
    xfce4-clipman-plugin
    xfce4-cpufreq-plugin
    xfce4-cpugraph-plugin
    xfce4-diskperf-plugin
    xfce4-docklike-plugin
    xfce4-genmon-plugin
    xfce4-indicator-plugin
    xfce4-mailwatch-plugin
    xfce4-mixer
    xfce4-mpc-plugin
    xfce4-notes-plugin
    xfce4-panel-profiles
    xfce4-places-plugin
    xfce4-sensors-plugin
    xfce4-smartbookmark-plugin
    xfce4-stopwatch-plugin
    xfce4-systemload-plugin
    thunar-shares-plugin
    thunar-volman
    xfce4-goodies
    pavucontrol
    gvfs
    xarchiver
    xfce4-xkb-plugin
    xdg-desktop-portal-xapp
    xdg-user-dirs-gtk
    network-manager-applet
    gnome-keyring
    xdg-user-dirs
    galculator
    gvfs-afc
    gvfs-gphoto2
    gvfs-mtp
    gvfs-nfs
    gvfs-smb
    thunar-archive-plugin
    thunar-media-tags-plugin
  ];

}
