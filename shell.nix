{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    qt6Packages.sddm
    qt6.qtdeclarative
    qt6.qtshadertools
    qt6.qtmultimedia

    ffmpeg
  ];

  shellHook = ''
    echo "Shell activated"

    # Tell Qt where to find the PipeWire and FFmpeg libraries
    export LD_LIBRARY_PATH="${pkgs.pipewire}/lib:${pkgs.ffmpeg}/lib:$LD_LIBRARY_PATH"

    # Tell Qt where to find the multimedia plugins
    export QT_PLUGIN_PATH="${pkgs.qt6.qtmultimedia}/lib/qt-6/plugins:$QT_PLUGIN_PATH"

    export QML2_IMPORT_PATH="${pkgs.qt6.qtdeclarative}/lib/qt-6/qml:${pkgs.qt6.qtmultimedia}/lib/qt-6/qml:${pkgs.qt6Packages.sddm}/lib/qt-6/qml"

    alias preview-theme="sddm-greeter-qt6 --test-mode --theme ./theme"
  '';
}