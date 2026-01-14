{ config, lib, pkgs, ... }:

{

services.flatpak.enable = true;
 systemd.services.flatpak-repo = {
   wantedBy = [ "multi-user.target" ];
   requires = [ "network-online.target" ];
   after = [ "network-online.target" ];
   wants = [ "network-online.target" ];
   path = [ pkgs.flatpak ];
   script = ''
             flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo &&
             flatpak install -y flathub io.github.kolunmi.Bazaar &&
             flatpak install -y flathub io.github.flattool.Warehouse &&
             flatpak install -y flathub com.github.tchx84.Flatseal &&
             flatpak install -y flathub io.github.giantpinkrobots.flatsweep &&
             flatpak install -y flathub com.usebottles.bottle &&
             flatpak install -y flathub io.github.dvlv.boxbuddyrs
             flatpak install -y flathub it.mijorus.gearlever &&
   '';
  }
