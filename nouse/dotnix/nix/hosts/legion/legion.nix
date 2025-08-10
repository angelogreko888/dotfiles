{ config, lib, pkgs, modulesPath, home-manager, ... }:
{
 imports =
    [ 
        ./configuration.nix 
        ../shared-configuration.nix
	../../modules/legion
	../hyprland.nix
    ];


  environment.systemPackages = with pkgs; [
  
  ];

  programs.hyprland.enable = true;

 fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/d35d5160-e5e6-4e9e-b13e-c613d4e99624";
    fsType = "ext4";
  };

}
