{ self, channel, system, platform, modules, user }:
let
  inputs = channel;
  sudo = "/usr/bin/sudo";
  username = user;
in
inputs.nix-darwin.lib.darwinSystem {
  specialArgs = {
    inherit user;
    inherit inputs;
    inherit system;
    inherit platform;
    inherit sudo;
  };

  modules = [
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = username;
        taps = {
          "homebrew/homebrew-core" = inputs.homebrew-core;
          "homebrew/homebrew-cask" = inputs.homebrew-cask;
        };
      };
    }
  ] ++ modules;
}
