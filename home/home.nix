{
  pkgs,
  system,
  ...
}:

{
  imports = [
    ./features/cli
    ./flatpaks.nix
  ];

  home = {
    username = "greg";
    homeDirectory = "/home/greg";
    stateVersion = "25.05";
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
    # package = pkgs.vscodium;
    # profiles.default.extensions = with pkgs.vscode-extensions; [
    # monokai.theme-monokai-pro-vscode
    # catppuccin.catppuccin-vsc-icons
    # pkief.material-product-icons
    # elijah-potter.harper
    # ms-python.python
    # ms-python.vscode-pylance
    # ms-python.debugpy
    # charliermarsh.ruff
    # njpwerner.autodocstring
    # jgclark.vscode-todo-highlight
    # oderwat.indent-rainbow
    # ms-toolsai.jupyter
    # ms-toolsai.jupyter-renderers
    # jnoortheen.nix-ide
    # thenuprojectcontributors.vscode-nushell-lang
    # tomoki1207.pdf
    # rust-lang.rust-analyzer

    # github.copilot
    # github.copilot-chat
    # ];
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

  catppuccin = {
    enable = true;
    accent = "sapphire";
    flavor = "macchiato";

    starship.enable = false;
    helix.enable = false;
    vscode.profiles.default.enable = false;
  };
}
