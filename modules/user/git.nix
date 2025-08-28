{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
	 config = {
	   user.name = "Masternaka";
     user.email = "gabthesniper@gmail.com";
	   init.defaultBranch = "main";
	  };
  };
}
