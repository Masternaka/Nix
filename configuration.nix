{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Modules NixOS personnalisés
      ../../Modules/system/filesystem.nix
      ../../Modules/system/service.nix
      ../../Modules/system/gnome.nix
      ../../Modules/system/kde.nix
      ../../Modules/system/xfce.nix
    ];

  # Bootloader configuration pour systemd-boot.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 15;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "desktop-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_CA.UTF-8";


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ca";
    variant = "multix";
  };

  # Configure console keymap
  console.keyMap = "cf";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gabriel = {
    isNormalUser = true;
    description = "Gabriel Chapdelaine";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];

  };

  # Ajout de l'accélération matérielle vidéo
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      intel-media-driver
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    home-manager
  ];

  # Allow unfree packages in the system.
    nixpkgs.config.allowUnfree = true;

  # Permettre des paquets insecure
  # nixpkgs.config.permittedInsecurePackages = [
  #   "openssl-1.1.1w"
  # ];

  # wheel group gets trusted access to nix daemon
  nix.settings.trusted-users = [ "@wheel" ];

  # Ensure nix flakes are enabled
  nix.settings.experimental-features =[ "flakes" "nix-command" ];

  # Permet l'utilisation de configuration personelle sans home-manager
  # environment.variables.KITTY_CONFIG_DIRECTORY = "~/.config/kitty";


  system.stateVersion = "25.05"; # Did you read the comment?
