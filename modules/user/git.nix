{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
	  userName = "Masternaka";
    userEmail = "gabthesniper@gmail.com";
    alias = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
	  extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "micro";
      };
      pull.rebase = true;
      push.autoSetupRemote = true;
      };
	  };
  };
}
