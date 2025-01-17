{
  description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # Latest stable release
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    nixosConfigurations = {
      # Virtual Machine config
      gg-nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./gg-nixos.nix  # Host config
          home-manager.nixosModules.home-manager  # Home Manager module
          {
            home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.grant = import ./home.nix;
	        }
	      ];
      };
      gg-desktop-vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./gg-desktop-vm.nix # Host config
        ];
      };
      # TODO: Install this shit on my laptop
      gg-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
	      modules = [
	        ./configuration.nix # TODO: Maybe not
	      ];
      };
    };
    # homeConfigurations = {
      # gg-nixos = home-manager.lib.homeManagerConfiguration {
      #
      # };
    # };
  };
}

