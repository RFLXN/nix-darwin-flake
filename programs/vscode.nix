{ config, pkgs, user, ... }: {
  home-manager.users.${user}.home.sessionPath = [
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  ];
}