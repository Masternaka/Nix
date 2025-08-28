{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
	 config = {
	   user.name = "Matthew Weber";
     user.email = "mtwb47@gmail.com";
	   init.defaultBranch = "main";
	  };
  };
}
