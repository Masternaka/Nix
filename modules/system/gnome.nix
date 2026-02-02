{ config, lib, pkgs, ... }:

####### Bien vérifier le nom des paquets dans https://search.nixos.org/packages avant #######
####### d'ajouter des paquets à cette liste. #######

services = {
  udev.packages = [ pkgs.gnome-settings-daemon ];
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  displayManager.autologin = {
    enable = false;
    user = "gabriel";
  };

}

xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  config.common.default = "gnome";
};

blueman.enable = true;

systemd.services."getty@tty1".enable = false;
systemd.services."autovt@tty1".enable = false;

programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
};

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

    # Gnome
    gnome-tweaks
    showtime
    shotwell

    # Terminal
    ghostty
    ptyxis

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
    #gnomeExtensions.dash-to-panel
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

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     # Paramètres GNOME
     # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     programs.dconf = {
       enable = true;
       profiles.gdm.databases = [
         {
           settings = {
             # Numlock
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

             "org/gnome/desktop/peripherals/touchpad" = {
               click-method = "areas";
               tap-to-click = true;
               two-finger-scrolling-enabled = true;
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
                 "quick-settings-audio-panel@rayzeq.github.io"
                 "rounded-window-corners-reborn@code@fxgn.dev"
               ];
               favorite-apps = [
                 "firefox.desktop"
                 "org.gnome.Nautilus.desktop"
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

             "org/gnome/mutter" = {
               check-alive-timeout = lib.gvariant.mkUint32 30000;
               dynamic-workspaces = true;
               edge-tiling = false;
             };
}
