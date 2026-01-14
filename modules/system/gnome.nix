{ config, lib, pkgs, ... }:

####### Bien vérifier le nom des paquets dans https://search.nixos.org/packages avant #######
####### d'ajouter des paquets à cette liste. #######

{
  environment.systemPackages = with pkgs; [
    #gnome-disk-utility
    #gnome-shell-extensions
    #gvfs
    #gvfs-afc
    #gvfs-gphoto2
    #gvfs-mtp
    #gvfs-nfs
    #gvfs-smb
    #xdg-user-dirs-gtk
    #qt6-wayland

    # Thèmes et icônes
    adw-gtk3
    graphite-gtk-theme
    tela-circle-icon-theme
    vimix-cursors

    # gnome
    gnome-tweaks
    showtime
    shotwell

    # Extensions GNOME
    gnomeExtensions.user-theme
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.impatience
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-shell
    gnomeExtensions.vitals
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.gsconnect
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.dash-to-panel
    gnomeExtensions.open-bar
    gnomeExtensions.arcmenu
    gnomeExtensions.bluetooth-battery

  ];
  
  gnome.excludePackages = with pkgs; [
    tali
    iagno
    hitori
    atomix
    yelp
    geary
    xterm
    totem
    epiphany
    packagekit
    gnome-tour
    gnome-software
    gnome-contacts
    gnome-user-docs
    gnome-packagekit
    gnome-font-viewer
    gnome-music

  ];

  programs.kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
  };

} 