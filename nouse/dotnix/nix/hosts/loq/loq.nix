{ config, lib, pkgs, modulesPath, home-manager, ... }:
{
 imports =
    [ 
        ./configuration.nix 
        ../shared-configuration.nix
	../../modules/loq
	../hyprland.nix
	./nvidia.nix
	./printer.nix
    ];


  environment.systemPackages = with pkgs; [
  
  ];

  programs.hyprland.enable = true;

 fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/7612ec6b-fe49-47e0-a964-f8fada9c0bea";
    fsType = "ext4";
  };

}
