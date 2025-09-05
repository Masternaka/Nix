{ config, lib, pkgs, ... }:

{
  programs.kitty = {
  enable = true;
  font = {
    name = "FiraCode Nerd Font";
    size = 12.0;
  };
  settings = {
    background_opacity = "0.8";
    cursor_shape = "beam";
    cursor_blink_interval = "0.6";
    copy_on_select = "yes";
    scrollback_lines = "10000";
    enable_audio_bell = "no";
    macos_option_as_alt = "yes";
    open_url_with = "default";
    hide_window_decorations = "no";
    initial_window_width = "120";
    initial_window_height = "30";
    enable_ligatures = "yes";
    tab_bar_edge = "top";
    wrap_lines = "yes";
    show_hyperlink_targets = "yes";
    focus_follows_mouse = "yes";
    bell_on_tab = "yes";
    strip_trailing_spaces_in_copy = "yes";
    allow_remote_control = "yes";
    selection_background = "#44475a";
    selection_foreground = "#f8f8f2";
    cursor_color = "#ffcc00";
    visual_bell_color = "#ff5555";
  };
  keybindings = {
    "ctrl+tab" = "next_tab";
    "ctrl+shift+tab" = "previous_tab";
    "ctrl+shift+enter" = "launch --type=window";
    "ctrl+shift+minus" = "launch --type=window --location=hsplit";
    "ctrl+t" = "new_tab";
    "ctrl+w" = "close_tab";
    "ctrl+enter" = "toggle_fullscreen";
  };
  extraConfig = ''
    ######################### Dracula theme #########################

    # foreground            #f8f8f2
    # background            #282a36
    # selection_foreground  #ffffff
    # selection_background  #44475a
# 
    # url_color #8be9fd
# 
    # # black
    # color0  #21222c
    # color8  #6272a4
# 
    # # red
    # color1  #ff5555
    # color9  #ff6e6e
# 
    # # green
    # color2  #50fa7b
    # color10 #69ff94
# 
    # # yellow
    # color3  #f1fa8c
    # color11 #ffffa5
# 
    # # blue
    # color4  #bd93f9
    # color12 #d6acff
# 
    # # magenta
    # color5  #ff79c6
    # color13 #ff92df
# 
    # # cyan
    # color6  #8be9fd
    # color14 #a4ffff
# 
    # # white
    # color7  #f8f8f2
    # color15 #ffffff
# 
    # # Cursor colors
    # cursor            #f8f8f2
    # cursor_text_color background
# 
    # # Tab bar colors
    # active_tab_foreground   #282a36
    # active_tab_background   #f8f8f2
    # inactive_tab_foreground #282a36
    # inactive_tab_background #6272a4
# 
    # # Marks
    # mark1_foreground #282a36
    # mark1_background #ff5555
# 
    # # Splits/Windows
    # active_border_color #f8f8f2
    # inactive_border_color #6272a4

    ############################## Gruvbox theme #########################

    # cursor                  #928374
    # cursor_text_color       background
# 
    # url_color               #83a598
# 
    # visual_bell_color       #8ec07c
    # bell_border_color       #8ec07c
# 
    # active_border_color     #d3869b
    # inactive_border_color   #665c54
# 
    # foreground              #ebdbb2
    # background              #282828
    # selection_foreground    #928374
    # selection_background    #ebdbb2
# 
    # active_tab_foreground   #fbf1c7
    # active_tab_background   #665c54
    # inactive_tab_foreground #a89984
    # inactive_tab_background #3c3836
# 
    # # black  (bg3/bg4)
    # color0                  #665c54
    # color8                  #7c6f64
# 
    # # red
    # color1                  #cc241d
    # color9                  #fb4934
# 
    # #: green
    # color2                  #98971a
    # color10                 #b8bb26
# 
    # # yellow
    # color3                  #d79921
    # color11                 #fabd2f
# 
    # # blue
    # color4                  #458588
    # color12                 #83a598
# 
    # # purple
    # color5                  #b16286
    # color13                 #d3869b
# 
    # # aqua
    # color6                  #689d6a
    # color14                 #8ec07c
# 
    # # white (fg4/fg3)
    # color7                  #a89984
    # color15                 #bdae93

    ############################## Catppuccin-Macchiato #########################

    # foreground              #CAD3F5
    # background              #24273A
    # selection_foreground    #24273A
    # selection_background    #F4DBD6
# 
    # # Cursor colors
    # cursor                  #F4DBD6
    # cursor_text_color       #24273A
# 
    # # URL underline color when hovering with mouse
    # url_color               #F4DBD6
# 
    # # Kitty window border colors
    # active_border_color     #B7BDF8
    # inactive_border_color   #6E738D
    # bell_border_color       #EED49F
# 
    # # OS Window titlebar colors
    # wayland_titlebar_color system
    # macos_titlebar_color system
# 
    # # Tab bar colors
    # active_tab_foreground   #181926
    # active_tab_background   #C6A0F6
    # inactive_tab_foreground #CAD3F5
    # inactive_tab_background #1E2030
    # tab_bar_background      #181926
# 
    # # Colors for marks (marked text in the terminal)
    # mark1_foreground #24273A
    # mark1_background #B7BDF8
    # mark2_foreground #24273A
    # mark2_background #C6A0F6
    # mark3_foreground #24273A
    # mark3_background #7DC4E4
# 
    # # The 16 terminal colors
# 
    # # black
    # color0 #494D64
    # color8 #5B6078
# 
    # # red
    # color1 #ED8796
    # color9 #ED8796
# 
    # # green
    # color2  #A6DA95
    # color10 #A6DA95
# 
    # # yellow
    # color3  #EED49F
    # color11 #EED49F
# 
    # # blue
    # color4  #8AADF4
    # color12 #8AADF4
# 
    # # magenta
    # color5  #F5BDE6
    # color13 #F5BDE6
# 
    # # cyan
    # color6  #8BD5CA
    # color14 #8BD5CA
# 
    # # white
    # color7  #B8C0E0
    # color15 #A5ADCB

    ######################### Nord theme #########################

    # Basic colors
    foreground           #d8dee9
    background           #2e3440
    selection_foreground #d8dee9
    selection_background #434c5e

    # Cursor colors
    cursor            #d8dee9
    cursor_text_color #3b4252

    # URL underline color when hovering with mouse
    url_color #0087bd

    # Window border colors and terminal bell colors
    active_border_color   #81a1c1
    inactive_border_color #4c566a
    bell_border_color     #88c0d0
    visual_bell_color     none

    # Tab bar colors
    active_tab_foreground   #3b4252
    active_tab_background   #88c0d0
    inactive_tab_foreground #e5e9f0
    inactive_tab_background #4c566a
    tab_bar_background      #3b4252
    tab_bar_margin_color    none

    # Mark colors (marked text in the terminal)
    mark1_foreground #3b4252
    mark1_background #88c0d0
    mark2_foreground #3b4252
    mark2_background #bf616a
    mark3_foreground #3b4252
    mark3_background #ebcb8b

    # The basic 16 colors
    # black
    color0 #3b4252
    color8 #4c566a

    # red
    color1 #bf616a
    color9 #bf616a

    # green
    color2  #a3be8c
    color10 #a3be8c

    # yellow
    color3  #ebcb8b
    color11 #d08770

    # blue
    color4  #81a1c1
    color12 #5e81ac

    # magenta
    color5  #b48ead
    color13 #b48ead

    # cyan
    color6  #88c0d0
    color14 #8fbcbb

    # white
    color7  #e5e9f0
    color15 #eceff4

  '';
};
