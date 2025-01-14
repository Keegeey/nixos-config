{
  description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";  # Adjust to your NixOS release
    #home-manager.url = "github:nix-community/home-manager/release-24.11";  # Match NixOS release
    home-manager-unstable = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      gg-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix  # Main NixOS config file
          home-manager.nixosModules.home-manager  # Home Manager module
          {
            home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.grant = import ./home.nix;
	  }
	];
      };
      gg-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [
	  ./configuration.nix
	];
      };
    };
  };
}

