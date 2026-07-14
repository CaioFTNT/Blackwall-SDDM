{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "Blackwall SDDM";
  version = "unstable";

  src = ./.;

  dontWrapQtApps = true;

  buildInputs = with pkgs; [ qt6.qtmultimedia ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes/blackwall
    cp -r $src/theme/* $out/share/sddm/themes/blackwall
  '';
}