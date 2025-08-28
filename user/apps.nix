{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./flatpaks.nix
      ./git.nix
      ./programs.nix
    ];

  users.users.matt = {
    isNormalUser = true;
    description = "Matthew Weber";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      element-desktop
      claude-code
      caligula
      lm_sensors
      amdvlk
      scowl
      handbrake
      imagemagick
      emacs
      clinfo
      rustup
      libnotify
      xwayland-satellite
      streamcontroller
      tmux
      vorta
      neovim
      calibre
      zip
      libgcc
      fzf
      lua
      bat
      discord
      fd
      killall
      ranger
      fastfetch
      inotify-tools
      curl
      wget
      eza
      cliphist
      zoxide
      borgbackup
      trash-cli
      obsidian
      audacity
      unzip
      htop
      btop
      gcc
      nextcloud-client
      zig
      kitty
      waybar
      swww
      pyprland
      mullvad-vpn
      oh-my-posh
      transmission_4-gtk
      python312Packages.pip
      wdisplays
      ripgrep
      fd
      emacsPackages.powerline-evil
      emacsPackages.vterm
      emacsPackages.markdown-mode
      tree-sitter
      jq
      pipx
      pulsemixer
      swaynotificationcenter
      swayidle
      hyprcursor
      grim
      slurp
      stow
      hyprlock
      rofi-wayland
      mpv
      util-linux
      kdePackages.kdenlive
      ffmpeg-full
      hugo
      wl-clipboard
      wireguard-tools
      aspell
      aspellDicts.en
      distrobox
      nodePackages.bash-language-server
      clang-tools
      lua-language-server
      nixpkgs-fmt
      shellcheck
 ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
}
