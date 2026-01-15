{ config, lib, pkgs, ... }:

# Configuration centralisée du firewall
{
  networking.firewall = {
    enable = true;
    allowPing = true;

    # Ports TCP
    allowedTCPPorts = [
      22   # SSH
      139  # NetBIOS Session Service (Samba)
      445  # SMB/CIFS (Samba)
    ];

    # Ports UDP
    allowedUDPPorts = [
      137  # NetBIOS Name Service (Samba)
      138  # NetBIOS Datagram Service (Samba)
    ];
  };
}
