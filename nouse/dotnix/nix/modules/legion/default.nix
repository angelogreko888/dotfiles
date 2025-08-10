{ lib, ... }:

{
  imports = [
    ./coffee-lake.nix
    ./prime.nix
    ./pascal.nix
    ./laptop.nix
    ./ssd.nix
    ./hdd.nix
  ];

  hardware = {
    nvidia = {
      modesetting.enable = lib.mkDefault true;
      powerManagement.enable = lib.mkDefault true;

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  services.thermald.enable = lib.mkDefault true;
}
