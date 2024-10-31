{ user, sudo, ... }:
let
  sourcePath = "~${user}/nix/programs/linearmouse";
  targetPath = "~${user}/.config/linearmouse";
  mkSymlink = filename: ''
    ${sudo} -u ${user} ln -sf ${sourcePath}/${filename} ${targetPath}/${filename}
  '';
in {
  system.activationScripts = {
    postUserActivation = {
      text = ''
        mkdir -p ${targetPath}
        ${mkSymlink "linearmouse.json"}
      '';
    };
  };
}