{ ... }: {
  system.defaults = {
    SoftwareUpdate = {
      AutomaticallyInstallMacOSUpdates = false;
    };

    CustomUserPreferences = {
      "com.apple.screencapture" = {
        disable-shadow = true;
      };

      "com.apple.menuextra.clock" = {
        DateFormat = "d MMM EEE a h:mm:ss";
        IsAnalog = false;
      };

      "com.apple.HIToolbox" = {
        AppleFnUsageType = 0;
      };
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = false;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSTableViewDefaultSizeMode = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      "com.apple.keyboard.fnState" = true;
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXSortFoldersFirst = true;
      FXEnableExtensionChangeWarning = true;
    };

    loginwindow = {
      GuestEnabled = false;
      ShutDownDisabled = false;
      SleepDisabled = false;
      RestartDisabled = false;
      ShutDownDisabledWhileLoggedIn = false;
      PowerOffDisabledWhileLoggedIn = false;
      RestartDisabledWhileLoggedIn = false;
      DisableConsoleAccess = false;
    };

    dock = {
      autohide = false;
      largesize = 16;
      launchanim = true;
      magnification = true;
      mineffect = "genie";
      orientation = "bottom";
      show-recents = true;
      persistent-apps = [
        "/System/Applications/Launchpad.app"
        "/Applications/Microsoft Edge.app"
        "/Applications/Discord.app"
        "/Applications/KakaoTalk.app"
        "/System/Applications/Messages.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/kitty.app"
        "/Applications/Spotify.app"
        "/System/Applications/Notes.app"
        "/System/Applications/Calculator.app"
        "/System/Applications/App Store.app"
        "/System/Applications/System Settings.app"
        "/System/Applications/Utilities/Activity Monitor.app"
      ];
    };
  };
}