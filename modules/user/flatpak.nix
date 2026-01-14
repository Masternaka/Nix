{ config, lib, pkgs, ... }:

{
  services.flatpak.packages = [
   "io.github.kolunmi.Bazaar"
   "io.github.flattool.Warehouse"
   "com.github.tchx84.Flatseal"
   "io.github.giantpinkrobots.flatsweep"
   "com.usebottles.bottle"
   "io.github.dvlv.boxbuddyrs"
   "it.mijorus.gearlever"
  ];

  systemd.services.flatpak-repo = {
  wantedBy = [ "multi-user.target" ];
  requires = [ "network-online.target" ];
  after = [ "network-online.target" ];
  wants = [ "network-online.target" ];
  path = [ pkgs.flatpak ];
  script = ''
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  '';

  }
