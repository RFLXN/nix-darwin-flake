{ platform, ... }: 
{
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    
    # app store applications
    masApps = {
      KakaoTalk = 869223134;
      "Microsoft Excel" = 462058435;
      "Microsoft Word" = 462054704;
      "Microsoft PowerPoint" = 462062816;
    };

    brews = [

    ];

    taps = [

    ];

    casks = [
      # terminals
      "kitty"
      
      # utils
      "linearmouse"
      "stats"
      "aldente"
      "karabiner-elements"
      "keka"
      
      # fonts
      "font-fira-code"

      # editor/ide
      "webstorm"
      "rustrover"
      "pycharm"
      "intellij-idea"
      "visual-studio-code"

      # etc.
      "microsoft-edge"
      "spotify"
      "discord"
    ];
  };
}