{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    qt6Packages.sddm
    qt6.qtdeclarative
  ];

  shellHook = ''
    echo "Shell activated"

    export QML2_IMPORT_PATH="${pkgs.qt6Packages.qtdeclarative}/lib/qt-6/qml:${pkgs.qt6Packages.sddm}/lib/qt-6/qml"
  '';
}