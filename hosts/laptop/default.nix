{
  imports = [./hardware-configuration.nix];

  garden = {
    device = {
      type = "laptop";
      cpu = "intel";
      gpu = "intel";
      # hasTPM = "true"; # TODO
      hasBluetooth = true;
      hasSound = true;
      keyboard = "pl";
    };

    environment = {
      desktop = {
        type = "Hyprland";
        hyprland = {
          useFlake = false;
        };
      };
      useHomeManager = true;
    };

    system = {
      mainUser = "scay";

      boot = {
        loader = "systemd-boot";
      };

      video.enable = true;
      sound.enable = true;
      bluetooth.enable = true;
      virtualization.enable = false;
      printing.enable = false;

      loginManager = {
        name = "greetd";
        autoLogin.enable = false;
      };
    };

    programs = {
      cli = {
        enable = true;
        shell = "zsh";
        git.enable = true;
        starship.enable = true;
      };

      tui = {
        enable = true;
        nvim.enable = true;
        yazi.enable = true;
        fzf.enable = true;
        btop.enable = true;
        lazygit.enable = true;
      };

      gui = {
        enable = true;
        thunar.enable = true;
        imageViewer = {
          vimiv.enable = true;
        };
        terminal = {
          kitty.enable = true;
        };
      };

      gaming = {
        enable = false;
      };
    };

    services = {
      syncthing.enable = false;
    };
  };
}
