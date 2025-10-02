{
  pkgs,
  system,
  ...
}:

{
  imports = [
    ./features/cli
  ];

  home = {
    username = "greg";
    homeDirectory = "/home/greg";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
  # basic configuration of git, please change to your own

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Adwaita";
  #     package = pkgs.adwaita-icon-theme;
  #   };
  # };

  programs.git = {
    enable = true;
    userName = "Greg";
    userEmail = "platongrigore@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
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
}
