let nixpkgs = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/66acfa3d16eb599f5aa85bda153a24742f683383.tar.gz") {
      config.allowUnfree = true;
    };

    pkgs = nixpkgs.pkgs;

in pkgs.mkShell rec {
  name = "ethminer";
  buildInputs = with pkgs; [
    llvmPackages_8.clang
    cmake
    cmakeCurses
    pkgconfig

    cli11
    boost
    cudatoolkit_10
    ethash
    opencl-info
    ocl-icd
    openssl
    jsoncpp
  ];
  shellHook = ''
    export PS1="$(echo -e '\uf277') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
    export CC=clang
    export CXX=clang++
  '';
}
