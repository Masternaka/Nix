{ config, lib, pkgs, ... }:

{
  services.flatpak.packages = [
    org.dupot.easyflatpak
    io.github.flattool.Warehouse
    com.github.tchx84.Flatseal
    io.github.giantpinkrobots.flatsweep
    com.usebottles.bottles
  ];
}
