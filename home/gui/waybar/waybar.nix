{
  pkgs,
  lib,
  osConfig,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (osConfig.garden.device) monitors;

  cfg = osConfig.garden.environment.desktop.type;
in {
  config = mkIf (cfg == "Hyprland") {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = {
        mainBar = {
          position = "top";
          layer = "top";
          height = 23;
          output =
            if builtins.length monitors > 0
            then builtins.elemAt monitors 0
            else null;
          modules-left = [
            "hyprland/workspaces"
            "hyprland/mode"
            "hyprland/scratchpad"
            "hyprland/window"
          ];
          modules-center = [
            "clock"
            #"custom/windowstate_0"
          ];
          modules-right = [
            "mpris"
            "custom/colorpicker"
            #"custom/todoist"
            "cpu"
            "memory"
            "temperature"
            "pulseaudio"
            "custom/notification"
            "tray"
          ];
          include = [
            "~/.config/waybar/modules.json"
          ];
        };

        secondBar = mkIf (builtins.length monitors > 1) {
          position = "top";
          layer = "top";
          height = 23;
          output = builtins.elemAt monitors 1;
          modules-left = [
            "hyprland/workspaces"
            "hyprland/mode"
            "hyprland/scratchpad"
            "hyprland/window"
          ];
          modules-center = [
            "clock"
            #"custom/windowstate_1"
          ];
          modules-right = [
            "mpris"
            "custom/colorpicker"
            #"custom/todoist"
            "cpu"
            "memory"
            "temperature"
            "pulseaudio"
            "tray"
          ];
          include = [
            "~/.config/waybar/modules.json"
          ];
        };
      };
    };

    xdg.configFile."waybar/scripts" = {
      source = ./scripts;
      recursive = true;
    };

    xdg.configFile."waybar/style.css".source = ./style.css;
    xdg.configFile."waybar/modules.json".source = ./modules.json;
  };
}
