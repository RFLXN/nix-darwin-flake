{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # git
    git
    gh

    # zsh
    zsh
    zsh-powerlevel10k

    # default tools
    file
    hostname
    tree
    watch
    wget
    curl

    # cli editors
    vim
    nano

    # networking
    inetutils

    # languages
    rustc
    rustup
    nodejs_22
    yarn
    python3
    jdk22

    # rust tools
    wasm-pack
    cargo-generate

    # docker
    docker
    docker-client
    colima

    pkg-config
    openssl
    openssl.dev
    zlib
    
    bashInteractive
    bzip2
    coreutils-full
    cpio
    curl
    diffutils
    findutils
    gawk
    stdenv.cc.libc
    getent
    getconf
    gnugrep
    gnupatch
    gnused
    gnutar
    gzip
    xz
    less
    ncurses
    netcat
    openssh
    procps
    time
    util-linux
    which
    zstd
  ];
}