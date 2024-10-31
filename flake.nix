{
    description = "RFLXN's nix-darwin flake";

    inputs = {
      # stable
      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
      home-manager-stable.url = "github:nix-community/home-manager/release-24.05";
      home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
      nix-darwin-stable.url = "github:LnL7/nix-darwin";
      nix-darwin-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
      nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

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
      };

      profile = {
        inherit self;
        user = "YOUR_MAC_USERNAME";
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
      darwinConfigurations."YOUR_MAC_HOSTNAME" = darwinSystem profile;
      darwinPackages = (darwinSystem profile).pkgs;
    };
}
