{ inputs, config, pkgs, user, ... }:

{

  imports =[
    ./modules
  ];

  home.username = "vago";
  home.homeDirectory = "/home/vago";

  home.stateVersion = "25.05";

  home.sessionVariables = {
     EDITOR = "nano";
  };

  programs.home-manager.enable = true;

  programs.fish.enable = true;

  home.sessionPath = [
    "${user.home}/bin"
  ]; 

  news.display = "silent";



}
