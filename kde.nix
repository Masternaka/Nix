{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kate
  ];

}
