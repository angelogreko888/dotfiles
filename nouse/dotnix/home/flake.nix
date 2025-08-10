{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#   nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      user = {
        name = "vago";
        home = "/home/vago";
        fullName = "vago";
      };

       pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

	theme = {
		 gtk = {
			theme = {
        		name = "Adwaita-dark";
		        package = pkgs.adw-gtk3;
      			};
			gtk3.extraConfig = {
			Settings = ''
			gtk-application-prefer-dark-theme=1
      			'';
    			};
			gtk4.extraConfig = {
			Settings = ''
			gtk-application-prefer-dark-theme=1
      			'';
    			};
  		};

        themePackage = pkgs.adw-gtk3;
        themeName = "adw-gtk3-dark";
        qtPlatformTheme = "gtk";
        qtStyleName = "adwaita-dark";
      };

#	};

    in {
      homeConfigurations."${user.name}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs user pkgs; };
        modules = [ 
          ./home.nix 
          ];
      };
    };
}
