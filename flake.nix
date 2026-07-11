{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs   = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };

      packages.${system}.default = import ./package.nix { inherit pkgs; };

      nixosModules.default = import ./module.nix;
    };
}