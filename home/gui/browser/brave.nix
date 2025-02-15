{
  lib,
  osConfig,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = osConfig.garden.programs.gui;
in {
  programs.brave = mkIf cfg.brave.enable {
    enable = true;

    # https://wiki.archlinux.org/title/Chromium#Native_Wayland_support
    commandLineArgs = [
      #"--ozone-platform-hint=auto"
      #"--ozone-platform=wayland"
      # make it use GTK_IM_MODULE if it runs with Gtk4, so fcitx5 can work with it.
      # (only supported by chromium/chrome at this time, not electron)
      #"--gtk-version=4"
      # make it use text-input-v1, which works for kwin 5.27 and weston
      #"--enable-wayland-ime"

      # enable hardware acceleration - vulkan api
      "--enable-features=Vulkan"

      # use the plain text store
      #"--password-store=basic"
    ];
  };
}
