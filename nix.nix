{ config, pkgs, system, ... }: {
  system = {
    stateVersion = 5;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    extraOptions = "extra-platforms = x86_64-darwin";

    gc = {
      automatic = true;
      interval = [{ Hour = 9; Minute = 0; }]; # = 9:00 KST
      options = "--delete-older-than 30d";
    };

    optimise = {
      automatic = true;
      interval = [{ Hour = 18; Minute = 0; }]; # = 18:00 KST
    };

    package = pkgs.nix;
  };

  services.nix-daemon.enable = true;

  nixpkgs = {
    hostPlatform = system;
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };

  programs = {
    nix-index = {
      enable = true;
    };
  };
}