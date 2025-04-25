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
    fnm # for node.js
    uv  # for python
    python314

    # docker
    docker
    docker-client
    colima
    
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
