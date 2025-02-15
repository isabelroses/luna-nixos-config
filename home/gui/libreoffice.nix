{
  lib,
  pkgs,
  osConfig,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = osConfig.garden.programs.gui;
in {
  config = mkIf cfg.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
