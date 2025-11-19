{ config, lib, pkgs, ... }:

{

  # Pour utiliser le shell bash
  environment.shells = with pkgs; [ bash ];
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

  # Gestionnaire de fichiers dans le terminal
  programs.yazi.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  nixpkgs.config.firefox = {
    enableWidevine = true;
  };

  # Programme qui facilite la gestion des commandes système pour la mise à jour 
  programs.nh.enable = true;

  # Programme pour la gestion des rgb de mon clavier
  services.hardware.openrgb.enable = true;

  # Configuration de logiciels avancés
  #programs.vim.package = pkgs.vim-full;
  #programs.vim.defaultEditor = true;

}
