{
  pkgs,
  lib,
  config,
  ...
}: let
  settings = {
    font = {
      name = "Terminess Nerd Font";
      # size = ;
      # color = ;
      # shadow = ;
    };

    viewer = {
      window = "#282828E6";
    };

    gallery = {
      window = "#282828E6";
    };

    "info.viewer".top_left = "name, imagesize, filesize";

    "keys.viewer" = {
      "0" = "first_file";
      "dollar" = "last_file";
      k = "prev_file";
      j = "next_file";
      f = "fullscreen";
      "Ctrl+h" = "step_left";
      "Ctrl+j" = "step_down";
      "Ctrl+k" = "step_up";
      "Ctrl+l" = "step_right";
      r = "rotate_right";
      "Shift+r" = "rotate_left";
      "Ctrl+r" = "reload";
      i = "info";
      "plus" = "zoom +10";
      "underscore" = "zoom +10";
      n = "zoom optimal";

      # d = "exec gtrash put '%'; status 'Trashed %'";
      # "Shift+d" = "exec rm '%'; status 'Deleted %'";
      # Delete = "exec rm '%'; status 'Deleted %'";

      y = "exec wl-copy < '%'; status 'Copied image'";
      "Shift+y" = "exec wl-copy '%'; status 'Copied image path'";

      ScrollUp = "zoom +5";
      ScrollDown = "zoom -5";

      Space = "mode";
    };

    "keys.gallery" = {
      h = "step_left";
      l = "step_right";
      k = "step_up";
      j = "step_down";

      Space = "mode";
    };
  };
in {
  home.packages = with pkgs; [swayimg];
  xdg.configFile."swayimg/config".text = lib.generators.toINI {} settings;
}
