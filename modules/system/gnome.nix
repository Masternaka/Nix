{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    tela-circle-icon-theme
    #qt6-wayland

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
  ];

 # Exclure les logiciels de GNOME par défaut installés
  #environment.gnome.excludePackages = with pkgs; [
   # gnome-tour
   # gnome.geary
  # ]; 
  
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
  ];

  programs.dconf = {
    enable = true;
    profiles.gdm.databases = [
      {
        settings = {
          "org/gnome/desktop/peripherals/keyboard" = {
            numlock-state = true;
          };
        };
      }
    ];
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
            theme = "adw-gtk3";
            focus-mode = "click";
            visual-bell = false;
          };
          "org/gnome/desktop/interface" = {
            cursor-theme = "Adwaita";
            gtk-theme = "adw-gtk3";
            icon-theme = "Tela-circle";
          };
          "org/gnome/desktop/peripherals/keyboard" = {
            numlock-state = true;
          };
          "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions = [
              "caffeine@patapon.info"
              "gsconnect@andyholmes.github.io"
              "appindicatorsupport@rgcjonas.gmail.com"
              "dash-to-dock@micxgx.gmail.com"
            ];
          };
          "org/gnome/shell/extensions/dash-to-dock" = {
            click-action = "minimize-or-overview";
            disable-overview-on-startup = true;
            dock-position = "BOTTOM";
            running-indicator-style = "DOTS";
            isolate-monitor = false;
            multi-monitor = true;
            show-mounts-network = true;
            always-center-icons = true;
            custom-theme-shrink = true;
          };
        };
      }
    ];
  };
}