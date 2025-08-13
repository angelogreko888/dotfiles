{
  description = "NixOS Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = {

      asus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
	modules = [
          ./hosts/asus/asus.nix
	];
      }; 


      legion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
	modules = [
          ./hosts/legion/legion.nix
	];
      }; 

      loq = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./hosts/loq/loq.nix
        ];
      }; 

   };

  };
}
