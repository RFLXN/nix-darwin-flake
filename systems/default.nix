{ user, pkgs, ... }:
let
  hostname = (
    builtins.readFile (pkgs.runCommand "hostname" { } ''
      /usr/sbin/scutil --get LocalHostName | /usr/bin/tr -d '\n' > $out
    '').outPath
  );
in {
  imports = [
    ./mac.nix
  ];

  networking.hostName = hostname;
  users.users = {
    "${user}" = {
      home = "/Users/${user}";
    };
  };
}