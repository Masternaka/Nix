{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "full";
        startup_mode = "Windowed";
        dimensions = {
          columns = 120;
          lines = 30;
        };
        opacity = 0.8;
      };
      font = {
        normal = {
          family = "Fira Code";
          style = "Regular";
        };
        size = 12.0;
      };
      colors = {
        primary = {
          background = "#222222";
          foreground = "#F9F9F9";
        };
      };
      scrolling = {
        history = 50000;
      };
    };
  };
}
