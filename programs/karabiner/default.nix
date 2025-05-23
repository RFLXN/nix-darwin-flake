{ user, sudo, ... }:
let
  sourcePath = "~${user}/nix/programs/karabiner";
  targetPath = "~${user}/.config/karabiner";
  mkSymlink = filename: ''
    ${sudo} -u ${user} ln -sf ${sourcePath}/${filename} ${targetPath}/${filename}
  '';
in {
  system.activationScripts = {
    postUserActivation = {
      text = ''
        mkdir -p ${targetPath}
        ${mkSymlink "karabiner.json"}
      '';
    };
  };
}