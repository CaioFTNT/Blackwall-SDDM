{ config, lib, pkgs, ... }:

let
  cfg = config.programs.blackwall-sddm;
  themePkg = (import ./package.nix { inherit pkgs; });
in {
  options.programs.blackwall-sddm = {
    enable = lib.mkEnableOption "Blackwall sddm theme";
  };

  config = lib.mkIf cfg.enable {
    qt.enable = true;

    services.displayManager.sddm = {
      enable = true;

      package = lib.mkForce pkgs.qt6Packages.sddm;
      extraPackages = with pkgs; [
        themePkg
        qt6.qtmultimedia
        pipewire
        ffmpeg
      ];

      settings = {
        General = {
          GreeterEnvironment = "LD_LIBRARY_PATH=${pkgs.pipewire}/lib:${pkgs.ffmpeg}/lib:$LD_LIBRARY_PATH,QT_PLUGIN_PATH=${pkgs.qt6.qtmultimedia}/lib/qt-6/plugins:$QT_PLUGIN_PATH";
        };
      };

      theme = "blackwall";
    };

    environment.systemPackages = [
      themePkg
    ];

    fonts.packages = [
      (pkgs.stdenv.mkDerivation {
        name = "blackwall-sddm-fonts";
        src = ./assets/fonts;
        installPhase = ''
          mkdir -p $out/share/fonts/blackwall-sddm
          cp -r ./* $out/share/fonts/blackwall-sddm/
        '';
      })
    ];
  };
}