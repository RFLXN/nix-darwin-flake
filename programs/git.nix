{ user, ... }: {
    home-manager.users.${user} = {
        programs.git = {
            enable = true;
            lfs.enable = true;
            userName = "YOUR_GIT_USERNAME";
            userEmail = "example@mail.com";
        };
    };
}