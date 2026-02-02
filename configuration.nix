{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # modules NixOS personnalisés
      ./modules/system/filesystem.nix
      ./modules/system/service.nix
      ./modules/system/samba.nix
      ./modules/system/networking.nix
      ./modules/system/firewall.nix
      ./modules/system/plasma.nix
      #./modules/system/gnome.nix
      #./modules/system/xfce.nix
      #./modules/system/i3wm.nix
    ];

  # Bootloader configuration pour systemd-boot.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "desktop-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "podman" "samba" "lpadmin" ];
    packages = with pkgs; [


    ];

  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  # Ajout de l'accélération matérielle vidéo
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      intel-media-driver
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
    micro
    wget
    git
    curl
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

  # Couche de compatibilité indispensable qui permet d'exécuter des binaires téléchargés hors de Nix, exemples AppImage, binaire de GitHub, etc.
    programs.nix-ld.enable = true;

    system.stateVersion = "25.05"; # Did you read the comment?

}
