{ lib, ... }:
{
  imports = [
    ./intel.nix
    ./nvidia.nix
    ./disable.nix
#    ./disablenvidia.nix
    ./prime.nix
#    ./prime-sync.nix	
    ./hdd.nix
    ./ssd.nix
  ];

 services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];

 hardware = {
    nvidia = {
      modesetting.enable = lib.mkDefault true;
      powerManagement.enable = lib.mkDefault true;
#
##      prime = {
##        intelBusId = "PCI:00:02:0";
##        nvidiaBusId = "PCI:01:00:0";
##      };
    };
  };

  services.thermald.enable = lib.mkDefault true;


}
