{
  lib,
  osConfig,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = osConfig.garden.programs.gui.terminal;
in {
  programs.kitty = mkIf cfg.kitty.enable {
    enable = true;

    themeFile = "gruvbox-dark";

    font = {
      name = "Iosevka Nerd Font";
      size = 13.5;
      # if (host == "laptop")
      # then 11
      # else 13.5;
    };

    settings = {
      scrollback_pager = "kitty-scrollback 'INPUT_LINE_NUMBER' 'CURSOR_LINE' 'CURSOR_COLUMN'";
      confirm_os_window_close = 0;
      background_opacity = "0.9";
      window_padding_width = 10;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      active_tab_foreground = "#FBF1C7";
      active_tab_background = "#7C6F64";
      inactive_tab_foreground = "#FBF1C7";
      inactive_tab_background = "#3C3836";
    };

    keybindings = {
      ## Tabs
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";

      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };
  };
}
