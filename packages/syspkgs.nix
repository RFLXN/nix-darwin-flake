{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # git
    git
    git-lfs
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
    llvm_18
    llvm_18.dev
    clang_18
    cmake
    ninja
    rustc
    rustup
    nodejs_18
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

    # build dependencies (libs)
    # pkg-config
    # openssl
    # openssl.dev
    # zlib
    
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