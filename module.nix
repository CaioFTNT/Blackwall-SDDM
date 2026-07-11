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
      extraPackages = [ themePkg ];

      theme = "blackwall";
    };

    environment.systemPackages = [
      themePkg
    ];
    
    fonts.packages = [
      (pkgs.stdenv.mkDerivation {
        name = "blackwall-sddm-fonts";
        src = ./theme/fonts;
        installPhase = ''
          mkdir -p $out/share/fonts/blackwall-sddm
          cp -r ./* $out/share/fonts/blackwall-sddm/
        '';
      })
    ];
  };
}