{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];
  # programs.alacritty.enable = true;
  # programs.alacritty.settings = {
  #   window.opacity = lib.mkForce 0.85;
    };
}



programs.alacritty = {
      enable = true;

      settings = {
        # Configuration de la fenêtre
        window = {
          decorations = "full";  # ["full", "none", ou "transparent"]
          # Exemples pour le mode au démarrage : "Maximized", "Fullscreen", "Windowed"
          startup_mode = "Windowed";
        };

        # Configuration de la police
        font = {
          normal = {
            family = "Fira Code";
            style = "Regular";
          };
          size = 12.0;
        };

        # Configuration des couleurs
        colors = {
          primary = {
            background = "#222222";
            foreground = "#F9F9F9";
          };
          #cursor = {
           # text = "#1d1f21";
           # cursor = "#c5c8c6";
          };
        };

        # Historique du défilement
        scrolling = {
          history = 50000;
        };
      };
        # Dimension de la fenêtre
        window.dimensions = {
          columns = 120;
          lines = 30;

      # Opacité de la fenêtre
        window.opacity = {
        opacity = 0.8;

    };
  }
