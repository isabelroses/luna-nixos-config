{...}: {
  imports = [
    #./ags # widgets
    ./browser # browsers
    ./discord/discord.nix # discord
    ./hyprland # wm
    ./image-viewer # image viewer applications
    ./rofi/rofi.nix # app launcher
    ./spotify/spicetify.nix # music
    ./swaync/swaync.nix # notification manager
    ./terminal # terminals
    ./waybar/waybar.nix # status bar
    ./anki.nix
    ./calibre.nix
    ./gaming.nix # gaming
    ./gimp.nix
    ./gnome.nix
    ./mpv.nix # media player
    ./pinta.nix
    ./shared.nix
    ./thunar.nix # file manager
    ./tofi.nix # app launcher
    ./vscodium.nix # editor
    ./zotero.nix
  ];
}
