{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #gnome-disk-utility
    gnome-tweaks
    gnome-shell-extensions
    gvfs
    gvfs-afc
    gvfs-gphoto2
    gvfs-mtp
    gvfs-nfs
    gvfs-smb
    xdg-user-dirs-gtk
    adw-gtk3
    #qt6-wayland
  ];

 # Exclure les logiciels de GNOME par défaut installés
  #environment.gnome.excludePackages = with pkgs; [
   # gnome-tour
   # gnome.geary
  # ]; 




}
