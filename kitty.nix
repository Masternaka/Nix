{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  # programs.kitty.enable = true;
  # programs.kitty.settings = {
  #   background_opacity = lib.mkForce "0.85";
  #   modify_font = "cell_width 90%";
  # };
}



programs.kitty = {
      enable = true;

      settings = {
        # Configuration de la police
        font = {
          family = "Fira Code";
          size = 12.0;
        };

        # Configuration des couleurs
        colors = {
          background = "#222222";
          foreground = "#F9F9F9";
        };

        # Historique du défilement
        scrolling = {
          history = 50000;
        };

        # Opacité de la fenêtre
        background_opacity = 0.8;

        # Thème de couleurs
        theme = "Gruvbox Dark";

    };
  }
