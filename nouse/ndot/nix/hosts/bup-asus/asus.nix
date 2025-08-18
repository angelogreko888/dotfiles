{ config, lib, pkgs, modulesPath,  ... }:
{
 imports =
    [ 
        ./configuration.nix 
        ../shared-configuration.nix
	./print.nix
    ];

  environment.systemPackages = with pkgs; [
  
  ];

  programs.hyprland.enable = true;

}
