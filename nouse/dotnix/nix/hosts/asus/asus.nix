{ config, lib, pkgs, modulesPath,  ... }:
{
 imports =
    [ 
        ./configuration.nix 
        ../shared-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
  
  ];

  programs.hyprland.enable = true;

}
