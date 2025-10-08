{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./nushell.nix
    ./starship.nix
    ./ghostty.nix
    ./helix.nix
  ];

  programs.zoxide.enable = true;
  programs.eza = {
    enable = true;
    # enableNushellIntegration = false;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    extraOptions = [
      "-l"
      "--icons"
      "--git"
      "-a"
    ];
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    # helix
    btop
    fd
    ripgrep
    tealdeer
    zip
    yazi
    gcr # Provides org.gnome.keyring.SystemPrompter
    fastfetch
    rustup
    uv
    pixi
    ruff
    pyright
    pylyzer
    typst
    tinymist
    marksman
    harper
    # julia-bin
  ];

}
