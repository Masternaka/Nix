{ config, lib, pkgs, ... }:
let
  myAliases = {
    ll = "ls -l";
    la = "ls -la";
    nrs = "sudo nixos-rebuild switch --flake ~/nixdotfiles#desktop-nix";
  };
in
{
  # Configuration personnelle pour mon utilisateur gabriel
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };
}
