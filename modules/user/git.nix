{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
	  userName = "Masternaka";
    userEmail = "gabthesniper@gmail.com";
	  extraConfig = {
      init.defaultBranch = "main";
	  };
  };
}
