{ config, lib, pkgs, ... }:

####### Bien vérifier le nom des paquets dans https://search.nixos.org/packages avant #######
####### d'ajouter des paquets à cette liste. #######

services = {
  displayManager.lightdm.enable = true;
  displayManager.defaultSession = "none+i3";
  desktopManager.xterm.enable = false;
  xserver.enable = true;
  displayManager.autologin = {
    enable = false;
    user = "gabriel";
  };

  windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      xorg
      xorg-dev
      xbacklight
      xbindkeys
      xvkbd
      xinput
      xdotool
      libnotify-bin
      libnotify-dev


    ];
  }
};

blueman.enable = true;

programs.dconf.enable = true;

{
  environment.systemPackages = with pkgs; [
    # PACKAGES_CORE=
    lxappearance
    sxhkd
    arandr
    autotiling

    # PACKAGES_UI
    polybar
    rofi
    dunst
    feh
    network-manager-gnome
    network-manager-applet
    lxpolkit

    # PACKAGES_FILE_MANAGER
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    gvfs-backends
    dialog
    mtools
    smbclient
    cifs-utils
    fd-find
    unzip

    # PACKAGES_AUDIO
    pavucontrol
    pulsemixer
    pamixer

    # PACKAGES_UTILITIES
    xfce4-power-manager

    # PACKAGES_TERMINAL
    suckless-tools

    # PACKAGES_FONTS
    fonts-recommended
    fonts-font-awesome
    fonts-terminus

  ];

}
