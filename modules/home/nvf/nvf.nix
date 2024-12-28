{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./plugins
    ./mappings.nix
  ];

  xdg.desktopEntries = {
    nvim = {
      name = "Neovim";
      type = "Application";
      mimeType = ["text/plain"];
      exec = "${pkgs.kitty}/bin/kitty nvim";
    };
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      leaderKey = " ";
      useSystemClipboard = true;
    };
  };
}
