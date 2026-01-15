{ config, lib, pkgs, ... }:

{

# Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
  ];
};

# Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    #jack.enable = true;
};

# Enable the X11 windowing system.
# You can disable this if you're only using the Wayland session.
# services.xserver.enable = true;
# services.wayland.enable = true;

# Préférence du displayManager
# services.displayManager.autoLogin.enable = true;
# services.displayManager.autoLogin.user = "gabriel";
# services.displayManager.defaultSession = "hyprland";

# Enable the GNOME Desktop Environment.
# services.displayManager.gdm.enable = true;
# services.desktopManager.gnome.enable = true;

# Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

# Enable the XFCE Desktop Environment.
# services.displayManager.lightdm.enable = true;
# services.desktopManager.xfce.enable = true;

# blueman.enable = true;
# Services à activer pour certains environment de bureau

# Ajout du support flatpak pour l'environment de bureau KDE plasma 6.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    xdgOpenUsePortal = true;
  };

# Ajout du support flatpak pour l'environment de bureau GNOME.
 # xdg.portal = {
 #   enable = true;
 #   extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
 #   config.common.default = "gnome";
 #   };

# Services pour réseau et disque
services.gvfs.enable = true;
services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

# Enable the OpenSSH daemon.
services.openssh = {
  enable = true;
  openFirewall = true;
  settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
  };
};

# Open ports in the firewall Configuration personnel.
networking.firewall = {
  enable = true;
  allowedTCPPorts = [
    139  # NetBIOS Session Service
    445  # SMB/CIFS
    22   # SSH
  ];
  allowedUDPPorts = [
    137  # NetBIOS Name Service
    138  # NetBIOS Datagram Service
  ];
};

# Active le service libvirtd, podman et docker
virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  };

# Active le service zramSwap
  zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 50; # Réduit pour desktop, 50% était trop
      priority = 100;
  };

# Nettoyage automatique ssd fstrim
  services.fstrim = {
      enable = true;
      interval = "weekly";
  };

# Optimisation du cache de fichier
  boot.kernel.sysctl = {
      "vm.swappiness" = 10; # Légèrement augmenté pour desktop
      "vm.vfs_cache_pressure" = 50; # Optimise le cache des fichiers
  };

# Optimiser le magasin Nix
nix.settings.auto-optimise-store = true; # Optimiser le magasin Nix
nix.gc.automatic = true; # Activer la collecte des ordures automatique
nix.gc.dates = "weekly"; # Planifier la collecte des ordures
nix.gc.options = "--delete-older-than 15d"; # Supprimer les fichiers plus vieux que 15 jours

# Active le service polkit
security.polkit.enable = true; # polkit
services.gnome.gnome-keyring.enable = true; # secret service

# Active le service flatpak
services.flatpak.enable = true;
}
