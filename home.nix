{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/user/programs.nix
    ./modules/user/flatpak.nix
    ./modules/user/sh.nix
    ./modules/user/samba.nix
    ./modules/user/git.nix
    ./modules/appsconfig/alacritty.nix
    ./modules/appsconfig/fastfetch.nix
    ./modules/appsconfig/kitty.nix
  ];

  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Base system
    #zsh

    # Terminal emulators et personnalisation
    kitty-themes
    kitty
    oh-my-posh

    # Utilitaire terminal
    fastfetch
    #fzf
    #bat
    ranger
    #yazi
    #eza
    #zoxide
    btop
    #ripgrep
    fd
    stow

    # Éditeurs de texte et outils de développement
    vscode
    zed-editor
    neovim
    meld
    #micro
    github-desktop
    gitkraken

    # Outils pour firewall
    firewalld-gui

    # Codec vidéos
    ffmpeg-full

    # Web browsers
    firefox
    brave
    vivaldi
    vivaldi-ffmpeg-codecs

    # Suite bureautique
    libreoffice-fresh

    # Prise de notes et organisation
    obsidian
    joplin

    # Multimédia
    vlc
    mpv
    gimp
    inkscape
    audacity
    krita
    obs-studio
    handbrake
    deadbeef
    spotify

    # AI
    claude-code

    # Virtualisation
    virt-manager
    qemu
    libvirt
    distrobox
    podman

    # Utilitaires spécifiques à NixOS
    nixpkgs-fmt

    # Utilitaires systèmes
    util-linux
    zip
    unzip
    imagemagick
    transmission_4-gtk
    qbittorrent
    lm_sensors
    lshw
    shellcheck
    catfish
    flameshot
    openrgb
    ipscan

    # Utilitaires divers
    raindropio

    # Cummunication
    discord
    #vesktop
  ];


  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };

  home.sessionVariables = {
    EDITOR = "nano";
    TERM = "kitty";
    BROWSER = "firefox";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Utiliser ceci pour utiliser Alacritty avec Home Manager mais sans créer de fichier de configuration .nix
  # home.file.".config/alacritty/alacritty.toml".source = ./alacritty.toml

}
