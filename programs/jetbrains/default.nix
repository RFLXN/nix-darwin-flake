{ config, pkgs, user, sudo, ... }:
let
  sourcePath = "~${user}/nix/programs/jetbrains";
  targetPath = "~${user}/.config/jetbrains";
  mkSymlink = filename: ''
    ${sudo} -u ${user} ln -sf ${sourcePath}/${filename} ${targetPath}/${filename}
  '';
in {
  system.activationScripts = {
    postUserActivation = {
      text = ''
        mkdir -p ${targetPath}
        ${mkSymlink "webstorm"}
        ${mkSymlink "rustrover"}
        ${mkSymlink "pycharm"}
        ${mkSymlink "intellij"}
        chmod +x ${targetPath}/webstorm
        chmod +x ${targetPath}/rustrover
        chmod +x ${targetPath}/pycharm
        chmod +x ${targetPath}/intellij
      '';
    };
  };

  home-manager.users.${user}.home.sessionPath = [
    "/Users/${user}/.config/jetbrains"
  ];
}