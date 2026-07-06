{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    qt6Packages.sddm
    qt6.qtdeclarative
    qt6.qtshadertools
    qt6.qtmultimedia
  ];

  shellHook = ''
    echo "Shell activated"

    export QML2_IMPORT_PATH="${pkgs.qt6.qtdeclarative}/lib/qt-6/qml:${pkgs.qt6.qtmultimedia}/lib/qt-6/qml:${pkgs.qt6Packages.sddm}/lib/qt-6/qml"
  '';
}