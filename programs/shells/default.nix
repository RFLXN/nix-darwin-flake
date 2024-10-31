{ pkgs, user, ... }: {
  environment.variables = {
    EDITOR = "nano";
  };

  environment.shells = with pkgs; [
    bash
    zsh
  ];

  users.users.${user} = {
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  home-manager.users.${user} = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = "source ~/.p10k.zsh";

      oh-my-zsh = {
        enable = true;

        plugins = [ "git" ];
      };
    };
  };

  imports = [ ./p10k.nix ];
}