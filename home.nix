{ config, pkgs, ... }:

{
  # Don't touch
  home.stateVersion = "24.11";
  
  home.username = "grant";
  home.homeDirectory = "/home/grant";

  programs.git = {
    enable = true;
    userName = "Grant";
    userEmail = "goode.grant@gmail.com";
  };
}
