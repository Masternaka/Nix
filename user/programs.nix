{ config, lib, pkgs, ... }:

{

  # Pour utiliser le shell bash
  environment.shell = with pkgs; [ bash ];
  users.defaultUserShell = pkgs.bash;
  programs.bash.enable = true;

  # Pour utiliser le shell zsh
  # environment.shell = with pkgs; [ zsh ];
  # users.defaultUserShell = pkgs.zsh;
  # programs.zsh.enable = true;

  # Pour utiliser le shell fish
  # environment.shell = with pkgs; [ fish ];
  # users.defaultUserShell = pkgs.fish;
  # programs.fish.enable = true;

  programs.virt-manager.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  nixpkgs.config.firefox = {
    enableWidevine = true;

  # Programme qui facilite la gestion des commandes système
  programs.nh.enable = true;


  # Configuration de logiciels avancés
  #programs.vim.package = pkgs.vim-full;
  #programs.vim.defaultEditor = true;

  # Exclure les logiciels de GNOME par défaut installés
  #environment.gnome.excludePackages = with pkgs; [
   # gnome-tour
   # gnome.geary
 # ];

 # Permettre des paquets insecure
 #nixpkgs.config.permittedInsecurePackages = [
              # "openssl-1.1.1w"
           #  ];

 };

 # Allow unfree packages in the system.
 nixpkgs.config.allowUnfree = true;



  };
}
