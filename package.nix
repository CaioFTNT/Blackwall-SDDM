{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "Blackwall SDDM";
  version = "unstable";

  src = ./theme;

  buildInputs = with pkgs; [ qt6.qtmultimedia ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes/blackwall
    cp -r $src/* $out/share/sddm/themes/blackwall
  '';
}