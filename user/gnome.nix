{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-disk-utility
  ];

}
