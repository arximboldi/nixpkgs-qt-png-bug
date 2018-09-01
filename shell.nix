{ nixpkgs ? (import <nixpkgs> {}).fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs";
    rev    = "411cc559c052feb6e20a01fc6d5fa63cba09ce9a";
    sha256 = "158xky2p5lfdd5gb1v7rl7ss5k31r2hwazn97srfviivx25karaw";
  }}:

with import nixpkgs {};

clangStdenv.mkDerivation rec {
  name = "nixpkgs-qt-png-bug";

  hardeningDisable = [ "fortify" ];

  buildInputs = [
    cmake
    pkgconfig
    qt56.full
  ];
  shellHook = ''
    build() {
      clang++ main.cpp -o example -std=c++11 \
        `pkg-config Qt5Gui Qt5Widgets --libs --cflags`
    }
  '';
}
