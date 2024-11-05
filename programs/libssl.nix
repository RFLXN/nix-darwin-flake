{ pkgs, ... }: {
    # for rust-openssl, we need to set PKG_CONFIG_PATH for find openssl by pkg-config
    environment.variables = {
        PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
}