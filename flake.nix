{
    description = "RFLXN's nix-darwin flake";

    inputs = {
      # stable
      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
      home-manager-stable.url = "github:nix-community/home-manager/release-24.11";
      home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
      nix-darwin-stable.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      nix-darwin-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
      nix-homebrew.url = "github:zhaofengli/nix-homebrew";
      homebrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
      };
      homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
      };

      # unstable
      nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager-unstable.url = "github:nix-community/home-manager";
      home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";
      nix-darwin-unstable.url = "github:LnL7/nix-darwin";
      nix-darwin-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    outputs = inputs@{ self, ... }: let
      # channels
      stable = {
        inherit self;
        channel = "stable";
        nixpkgs = inputs.nixpkgs-stable;
        nixpkgs-stable = inputs.nixpkgs-stable;
        nixpkgs-unstable = inputs.nixpkgs-unstable;
        home-manager = inputs.home-manager-stable;
        nix-darwin = inputs.nix-darwin-stable;
        nix-homebrew = inputs.nix-homebrew;
        homebrew-core = inputs.homebrew-core;
        homebrew-cask = inputs.homebrew-cask;
      };

      profile = {
        inherit self;
        user = "YOUR_USERNAME";
        channel = stable;
        platform = "darwin";
        system = "aarch64-darwin";
        modules = [
          ./nix.nix
          ./home-manager.nix
          ./packages
          ./programs
          ./systems
        ];
      };

      darwinSystem = import ./darwinSystem.nix;
    in {
      darwinConfigurations."YOUR_HOST_NAME" = darwinSystem profile;
      darwinPackages = (darwinSystem profile).pkgs;
    };
}
