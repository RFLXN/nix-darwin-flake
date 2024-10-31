# RFLXN's nix-darwin flake

from [github:EcmaXp/nix-public](https://github.com/EcmaXp/nix-public)

1. clone this repo to /Users/{user}/nix
2. edit username and hostname in flake.nix
3. open nix directory
4. run `darwin-rebuild switch --recreate-lock-file --flake .`