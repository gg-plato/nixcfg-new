{
  pkgs,
  ...
}:

{
  imports = [
    ./cli
    ./flatpaks.nix
  ];

  home = {
    username = "greg";
    homeDirectory = "/home/greg";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "Greg";
    settings.user.email = "platongrigore@gmail.com";
    settings.init.defaultBranch = "main";
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "platongrigore@gmail.com";
        name = "Greg";
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    extensions = [
      "nix"
      "catppuccin-icons"
      "nu"
      "typst"
      "zedokai"
      "harper"
      "rainbow-csv"
    ];
    userSettings = {
      theme = "Zedokai (Filter Octagon)";
      icon_theme = "Catppuccin Macchiato";
      buffer_font_family = "Monaspace Neon NF";
      terminal = {
        font_family = "Monaspace Neon NF";
      };
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
    };
  };

  services.udiskie = {
    enable = true;
    tray = "never";
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.cosmic-files}/bin/cosmic-files";
      };
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    targets = {
      zed.enable = false;
      zen-browser.enable = false;
      vscode.enable = false;
      starship.enable = false;
      helix.enable = false;
      ghostty.enable = false;
      fontconfig.enable = false;
      qt.enable = false;
    };
  };
}
