{ config, lib, pkgs, modulesPath,  ... }:
{
 imports =
    [ 
        ./configuration.nix 
        ../shared-configuration.nix
	./print.nix
	../hyprland.nix
    ];

  environment.systemPackages = with pkgs; [
  
  ];

  programs.hyprland.enable = true;

hardware.graphics = {                                                                            
    enable = true;                                                                                 
                                                                                                   
    enable32Bit = true;                                                                            
                                                                                                   
    extraPackages = with pkgs; [                                                                   
    #  nvidia-vaapi-driver                                                                          
      intel-media-driver                                                                          
      intel-vaapi-driver                                                                          
      libvdpau-va-gl                                                                               
    ];                                                                                             
                                                                                                   
    extraPackages32 = with pkgs.pkgsi686Linux; [                                                   
      intel-vaapi-driver                                                                          
    ];                                                                                             
  };

}
