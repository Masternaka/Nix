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
    # jack.enable = true;
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
    memoryPercent = 50; # Réduit pour desktop
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
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  # Active le service polkit
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true; # secret service

  # Active le service flatpak
  #services.flatpak.enable = true;
}
