{
  pkgs,
  lib,
  osConfig,
  ...
}: let
  cfg = osConfig.garden.programs.tui;

  inherit (lib.modules) mkIf;
in {
  programs.btop = mkIf cfg.btop.enable {
    enable = true;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      update_ms = 500;
    };
  };

  home.packages = with pkgs; [nvtopPackages.intel];
}
