{
  pkgs,
  config,
  ...
}: let
  inherit (config.garden.system) mainUser;

  cfg = config.garden.programs.cli.shell;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    description = "${mainUser}";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.${cfg};
  };
  nix.settings.allowed-users = ["${mainUser}"];
}
