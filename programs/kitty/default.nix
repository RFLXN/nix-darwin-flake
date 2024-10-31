{ user, sudo, ... }:
let
  sourcePath = "~${user}/nix/programs/kitty";
  targetPath = "~${user}/.config/kitty";
  mkSymlink = filename: ''
    ${sudo} -u ${user} ln -sf ${sourcePath}/${filename} ${targetPath}/${filename}
  '';
in {
  system.activationScripts = {
    postUserActivation = {
      text = ''
        mkdir -p ${targetPath}
        ${mkSymlink "kitty.conf"}
      '';
    };
  };
}